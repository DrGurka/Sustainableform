import functools
from json import JSONEncoder
import json

from typing import List
from flask.helpers import make_response
from . import db
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)

class Answer:
    Text: str
    NextQuestion: int

    def __init__(self, Text: str, NextQuestion: int) -> None:
        self.Text = Text
        self.NextQuestion = NextQuestion

    def __repr__(self):
        return "Text: %s, NextQuestion: %s" % (self.Text, self.NextQuestion)

    def __str__(self):
        return self.Text

class Condition:
    ID: int
    ButtonID: int

    def __init__(self, ID: int, ButtonID: int) -> None:
        self.ButtonID = ButtonID
        self.ID = ID

    def __repr__(self):
        return "NextQuestionID: %s, ButtonID: %s" % (self.ID, self.ButtonID)

class Question:
    ID: int
    Text: str
    Type: int
    Conditional: List[Condition]
    AnswerOptions: List[Answer]

    def __init__(self, ID: int, Text: str = "", Type: int = -1, Conditional: List[Condition] = [], AnswerOptions: List[Answer] = []) -> None:
        self.ID = ID
        self.Conditional = Conditional
        self.Text = Text
        self.Type = Type
        self.AnswerOptions = AnswerOptions

    def __repr__(self):
        return "QuestionID: %s, Text: %s, Type: %s Condition: %s, AnswerOptions: %s" % (self.ID, self.Text, self.Type, self.Conditional, self.AnswerOptions)

class QuestionEncoder(JSONEncoder):
    def default(self, obj):
        return obj.__dict__

bp = Blueprint('common', __name__, url_prefix='/')

@bp.route("/", methods=('GET', 'POST'))
def main():
    if request.method == 'POST':
        username = request.form['id-check']
        db1=db.get_db()
        error = None
        cursor=db1.cursor()
        stmt="SELECT ID, Type_ID FROM Users WHERE Email =%s"
        cursor.execute(stmt, username)
        user=cursor.fetchone()
        if user is None:
            print(stmt)
            print(user)
            error = 'Ogiltig email.'
        
        if error is None:
            session.clear()
            #saves the id in the session for future safety checks.
            session['user_id'] = user[0]

            questions = get_questions(user[1])
            session["questions"] = json.dumps(questions, cls=QuestionEncoder)
            session["currentQuestion"] = questions[0].ID

            response = make_response(redirect(url_for('questions.questionMain')))
            response.set_cookie('answers', '', expires=0)
            return response

        flash(error, 'error')
    return render_template("index.html")

def get_questions(typeID) -> List[Question]:
    cursor = db.get_db().cursor()
    cursor.execute("SELECT Questions.ID, Conditions.Button_ID, Conditions.Next_ID FROM Questions LEFT JOIN Conditions ON Questions.ID = Conditions.Question_ID WHERE Industry_ID=%s", typeID)
    response = cursor.fetchall()

    questions = []
    removeIds = []
    for question in response:
        existingQuestion = find_question(question[0], questions)
        if existingQuestion != None:
            existingQuestion.Conditional.append(Condition(question[2], question[1]))
            removeIds.append(question[2])
        elif question[1] != None:
            questions.append(Question(question[0], Conditional=[Condition(question[2], question[1])]))
            removeIds.append(question[2])
        else:
            questions.append(Question(question[0]))

    for id in removeIds:
        for question in questions:
            if question.ID == id:
                questions.remove(question)
           
    print(questions)
    return questions

def find_question(questionID: int, questionList: List[Question]):
    for question in questionList:
        if question.ID == questionID:
            return question
    return None

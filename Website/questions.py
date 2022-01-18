from typing import List

from pymysql import NULL
from . import common
# måste avkommentera raden nedan för att det ska funka på min dator. 
#from types import NoneType
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)

from flask.helpers import make_response
import json
from . import db

bp = Blueprint('questions', __name__, url_prefix='/')

@bp.route("/question", methods = ['GET', 'POST'])
def questionMain():
    if request.method == 'POST':
        jsonData = request.get_json()
        if "nextQuestion" in jsonData:
            if session.get("answered"):
                ansList = session["answered"]
                ansList.append(session["currentQuestion"])
                session["answered"] = ansList
            else:
                ansList = [session["currentQuestion"]]
                session["answered"] = ansList

            session["currentQuestion"] = jsonData["nextQuestion"]
        elif "previousQuestion" in jsonData:
            session["currentQuestion"] = jsonData["previousQuestion"]
            session["answered"].remove(jsonData["previousQuestion"])
        return ""
    else:
        questionID = int(session["currentQuestion"])
        if questionID != -1:
            previousQuestion = -1
            page = 1
            questions = json.loads(session["questions"])
            if session.get("answered"):
                previousQuestion = session["answered"][-1]
                for question in questions:
                    page += 1
                    if int(question["ID"]) == previousQuestion:
                        if bool(question['Conditional']) and int(question['Conditional'][0]['ID']) == questionID:
                            page -= 1
                        break
                    elif bool(question['Conditional']) and int(question['Conditional'][0]['ID']) == previousQuestion:
                        break
                    
            return returnTemplate(int(session["currentQuestion"]), previousQuestion, len(questions), page)
        else:
            return redirect(url_for("questions.questionThree"), )

def returnTemplate(questionID: int, previousID: int, totalQuestions: int, page: int):
    questions = json.loads(session["questions"])
    foundNext = False
    nextQuestion = -1
    currentQuestion = {}

    for question in questions:
        if foundNext:
            nextQuestion = question['ID']
            break

        if int(question['ID']) == questionID:
            currentQuestion = question
            foundNext = True
        elif bool(question['Conditional']) and int(question['Conditional'][0]['ID']) == questionID:
            foundNext = True
    
    question = getQuestion(questionID, nextQuestion, currentQuestion)
    return render_template("question1.html", answerOptions=question.AnswerOptions, nextQuestion=nextQuestion, previousQuestion=previousID, questionID=question.ID, questionType=question.Type, questionText=question.Text, pageNumber=page, totalQuestions=totalQuestions)

def getQuestion(questionID, nextQuestion, currentQuestion):
    cursor=db.get_db().cursor()
    stmt="SELECT Question_text, Type_ID FROM Questions WHERE ID=%s"
    cursor.execute(stmt, questionID)
    question = cursor.fetchone()
    options = getAnswerOptions(question[1])

    answerOptions = []
    for answer in options:
        foundCondition = False
        if bool(currentQuestion):
            for condition in currentQuestion['Conditional']:
                if condition['ButtonID'] == answer[0]:
                    foundCondition = True
                    answerOptions.append(common.Answer(answer[1], int(condition['ID'])))
        if not foundCondition:
            answerOptions.append(common.Answer(answer[1], nextQuestion))

    print(question)
    return common.Question(questionID, question[0], question[1], AnswerOptions=answerOptions)

def getAnswerOptions(typeId):
    cursor=db.get_db().cursor()
    stmt="SELECT ID, Button_Text FROM Answer_Types WHERE Type_ID = %s"
    cursor.execute(stmt, typeId)
    data=cursor.fetchall()
    options = []
    for option in data:
        options.append((option[0], option[1]))

    return options

@bp.route("/send-form" , methods=['GET','POST'])
def questionThree():
    questions = json.loads(session["questions"])
    prev = -1
    page = len(questions) +1
    if request.method == 'POST':
        if request.is_json:
            jsonData = request.get_json()
            connection = db.get_db()
            cursor = connection.cursor()
            for answer in jsonData:
                cursor.execute("INSERT INTO Answers (Answer, Question_ID, User_ID) VALUES (%s, %s, %s) ON DUPLICATE KEY UPDATE Answer=VALUES(Answer)"
                , (jsonData[answer], answer, session['user_id']))

            connection.commit()
            return redirect(url_for('questions.last'))

    return render_template("send-form.html", totalQuestions = len(questions), pageNumber = page, previousQuestion = prev)

@bp.route("/last")
def last():
    return render_template("last.html")  

@bp.route("/Admin-html/amdmin-log-in-html")
def start():
    return render_template("ad.html")    
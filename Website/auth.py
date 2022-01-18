import functools
from re import search
from sqlite3 import dbapi2
from pymysql.err import OperationalError

from flask import(
    Blueprint, flash, g, redirect, render_template, request, session, url_for, jsonify
)
from flask.wrappers import Request
import pymysql
from werkzeug.security import check_password_hash, generate_password_hash

from Website.common import Answer
from . import db

bp = Blueprint('auth', __name__, url_prefix='/')

#hej

@bp.route("/specificReport", methods= ('POST', 'GET'))
def specificReport():
    if (request.method == 'GET'):
        stmt = """SELECT Name, Question_text, Answer FROM Users, Questions, Answers
                where Answers.Question_ID = Questions.ID and
                Answers.User_ID = (
                Select Users.ID from Users
                where Users.Name = %s) and Users.Name = %s;"""

        conn=db.get_db()
        cursor=conn.cursor() 
       
        cursor.execute(stmt, (session['name'], session['name']))  
        answers = cursor.fetchall()
        return render_template("Admin-html/specificReport.html", name=session['name'], answers=answers)

@bp.route("/reportTemplate", methods= ('POST', 'GET'))
def reportTemplate():
    if (request.method == 'GET'):
        conn=db.get_db()
        cursor=conn.cursor()
        stmt="""SELECT count(*), Answers.Answer, Questions.Question_text FROM Answers
        LEFT JOIN Users ON User_ID=Users.ID
        LEFT JOIN Types on Types.ID=Type_ID
        LEFT JOIN Questions on Questions.ID=Question_ID
        WHERE Industry=%s
        group by Question_text, Answer"""
        cursor.execute(stmt, session['branch'])
        return render_template("Admin-html/reportTemplate.html", branch=session['branch'], answers=cursor.fetchall())
        

def ifPresent(value):
    conn = db.get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Users WHERE Name = (%s)", (value))
    if(cursor.rowcount > 0):
        return True
    else:
        return False
        

@bp.route("/admin", methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        username = request.form['username']
        password=request.form['password']
        db1=db.get_db()
        cursor=db1.cursor()
        error = None
        print(username, password)
        cursor.execute("SELECT * FROM Admins WHERE Username=%s AND Password=%s", (username, password))
        user=cursor.fetchone()
        if user is None:
            error = 'Ogiltig inloggning för admin.'
        
        if error is None:
            session.clear()
            session['user_id'] = 'Admin'
            print(session['user_id'])
            return redirect(url_for('auth.adminLoggedIn'))

        flash(error, 'error')

    return render_template('Admin-html/admin-log-in.html')


# Checks if admin is logged in. If not - /admin is rendered
@bp.route("/adminIndex", methods=('GET', 'POST'))
def adminLoggedIn():
    if request.method == 'GET':
        # Detta måste ändras, finns nog bättre sätt att kolla på om man är admin. Kanske en checksum eller något
        if session.get('user_id') is None or session['user_id'] != 'Admin':
            session.clear()
            return redirect(url_for('auth.login'))

    if request.method == 'POST':

        print(request.form.get('text'))

       # if(request.form.get('text') != " " and request.form.get('text') != None):
        #    searchbox = request.form.get("text")
         #   conn=db.get_db()
          #  cursor=conn.cursor()
           # stmt= "select Name from Users where Name LIKE '{}%' order by Name".format(searchbox)
            #cursor.execute(stmt)
            #if(cursor.rowcount < 5):
             #   result = cursor.fetchall()
              #  return jsonify(result)


        if(request.form['submit']=="logOut"):
            print("clearing session")
            session.clear()
            return redirect(url_for('auth.login'))

        if(request.form['submit'] == "deleteAnswers"):
            stmt="DELETE FROM Answers"
            conn=db.get_db()
            cursor=conn.cursor()
            cursor.execute(stmt)
            conn.commit()
            error="Alla svar från användarna togs bort"
            flash(error, 'success')

        if(request.form['submit'] == "removeUser"):
           
            stmt="DELETE FROM Users WHERE Email=(%s)"
            conn=db.get_db()
            cursor=conn.cursor()

            try:
                    cursor.execute(stmt, request.form['adress'])
                    conn.commit()
                    error="Användaren: " + request.form['adress'] + " togs bort"
                    flash(error, 'sucess')
            except pymysql.IntegrityError :
                error="Användaren: " + request.form['adress'] + " finns inte i systemet"
                flash(error, 'error')


        if(request.form['submit']=="addUser"):
           
            stmt="INSERT INTO Users (Type_ID, Email, Name) VALUES (%s, %s, %s)"
            print(stmt)
            conn=db.get_db()
            cursor=conn.cursor()
            try:
                if(request.form['name'] == ''):
                    name = None
                else:    
                    name = request.form['name']

                if(request.form['branch'] == 0):
                    branch = None
                elif(request.form['branch'] == "Restaurang"):
                    branch = 2
                elif(request.form['branch'] == "Hotell"):
                    branch = 1
                elif(request.form['branch'] == "Byrå"):
                    branch = 3
                
                cursor.execute(stmt, (branch, request.form['adress'], name))
                conn.commit()
                flash("Användaren: " + request.form['adress'] + " har lagts till i systemet", 'success')
            except pymysql.IntegrityError as e:
                error="Användaren:  " + request.form['adress'] + " finns redan i systemet"
                flash(error, 'error') 
            finally:
                cursor.close

        branches=["Restaurang", "Hotell", "Byrå", "Evenemangshall"]
        if(request.form['submit'] in branches):
            session['branch']=request.form['submit']
            return redirect(url_for("auth.reportTemplate"))
    
        if(request.form['submit']=="changePassword"):
            if(request.form['pass1']==request.form['pass2']):
                stmt="UPDATE Admin SET Password = %s WHERE (Username = %s)"
                conn=db.get_db()
                cursor=conn.cursor()
                cursor.execute(stmt, (request.form['pass1'], session['user_id']))
                conn.commit()
                flash("Lösenordsbytet lyckades.", 'sucess')
            else :
                error="Lösenorden matchade ej"
                flash(error,'')
    
        # Om admin sökt en enskild rapport 
        if(request.form['submit'] == "findReport"):
            if(ifPresent(request.form.get('text')) != False):
                session['name']=request.form.get('text')
                return redirect(url_for('auth.specificReport'))   
            else:
                error="Användaren: " + request.form.get('text') + " finns inte"
                flash(error, 'error')


    return render_template("Admin-html/admin-index.html")



            


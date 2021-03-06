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

from common import Answer
import db

bp = Blueprint('auth', __name__, url_prefix='/')

#hej

branches=["Restaurang", "Hotell", "Byrå", "Evenemangshall"]

@bp.route("/findReport", methods=('GET', 'POST'))
def findReport():
    if(ifPresent(request.form.get('text')) != False):
        session['name']=request.form.get('text')
        return redirect(url_for('auth.specificReport'))   
    else:
        error="Användaren: " + request.form.get('text') + " finns inte"
        flash(error, 'error')
        return redirect(url_for('auth.adminLoggedIn'))


# Specifik rapport
@bp.route("/specificReport", methods= ('POST', 'GET'))
def specificReport():
    if (request.method == 'GET'):
        stmt = """SELECT Name, Question_text, Answer FROM Users, Questions, Answers
                where Answers.Question_ID = Questions.ID and
                Answers.User_ID = (
                Select Users.ID from Users
                where Users.Name = %s) and Users.Name = %s order by Answers.Question_ID;"""

        conn=db.get_db()
        cursor=conn.cursor() 
       
        cursor.execute(stmt, (session['name'], session['name']))  
        answers = cursor.fetchall()
        return render_template("Admin-html/specificReport.html", name=session['name'], answers=answers)
        

# Fullständig rapport för branscher
@bp.route("/fullReport", methods=('GET', 'POST'))
def fullReport():

    if(request.form['submit'] in branches):
        session['branch']=request.form['submit']
        return redirect(url_for("auth.reportTemplate"))


# Rapport brancher
@bp.route("/reportTemplate", methods= ('POST', 'GET'))
def reportTemplate():
    if (request.method == 'GET'):
        conn=db.get_db()
        cursor=conn.cursor()
        stmt="""SELECT count(*), Answers.Answer, Questions.Question_text, Answers.Question_ID FROM Answers
        LEFT JOIN Users ON User_ID=Users.ID
        LEFT JOIN Types on Types.ID=Type_ID
        LEFT JOIN Questions on Questions.ID=Question_ID
        WHERE Industry=%s
        group by Question_text, Answer order by Answers.Question_ID"""
        cursor.execute(stmt, session['branch'])
        return render_template("Admin-html/reportTemplate.html", branch=session['branch'], answers=cursor.fetchall())

#Lista användare inom olika brancher
@bp.route("/showUsers", methods= ('POST', 'GET'))
def showUsers():
    if (request.method == 'POST'):
        stmt="SELECT Users.Name, Users.Email, Answers.User_ID FROM Users LEFT JOIN Answers ON Users.ID = Answers.User_ID WHERE Users.Type_ID=(%s) group by Users.Name order by Users.Name"
        conn=db.get_db()
        cursor=conn.cursor()
        if(request.form['branch'] not in branches):
            error = "Du måste ange en giltig branch"
            flash(error, 'error')
            return redirect(url_for('auth.adminLoggedIn'))
        elif(request.form['branch'] == "Restaurang"):
            branch = 2
        elif(request.form['branch'] == "Hotell"):
            branch = 1
        elif(request.form['branch'] == "Byrå"):
            branch = 3
        elif(request.form['branch'] == "Evenemangshall"):
            branch = 4
                
    cursor.execute(stmt, (branch))
    answers = cursor.fetchall()

    return render_template("Admin-html/admin-users.html", name=request.form['branch'], answers=answers)
        

def ifPresent(value):
    conn = db.get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Users WHERE Name = (%s)", (value))
    if(cursor.rowcount > 0):
        return True
    else:
        return False

def ifPresentEmail(value):
    conn = db.get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Users WHERE Email = (%s)", (value))
    if(cursor.rowcount > 0):
        return True
    else:
        return False
        

#Logga in
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

# Ta bort alla inrapporterade svar
@bp.route("/delete", methods=('GET', 'POST'))
def delete():
    stmt="DELETE FROM Answers"
    conn=db.get_db()
    cursor=conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    error="Alla svar från användarna togs bort"
    flash(error, 'success')
    return redirect(url_for('auth.adminLoggedIn'))

# Logga in och ut
@bp.route("/logOut", methods=('GET', 'POST'))
def logOut():
    session.clear()
    return redirect(url_for('auth.login'))

#För att lägga till eller ta bort användare
@bp.route("/changeUser", methods=('GET', 'POST'))
def changeUser():

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
                if(request.form['branch'] not in branches):
                    error = "Du måste ange en giltig branch"
                    flash(error, 'error')
                    return redirect(url_for('auth.adminLoggedIn'))
                elif(request.form['branch'] == "Restaurang"):
                    branch = 2
                elif(request.form['branch'] == "Hotell"):
                    branch = 1
                elif(request.form['branch'] == "Byrå"):
                    branch = 3
                elif(request.form['branch'] == "Evenemangshall"):
                    branch = 4
                
                cursor.execute(stmt, (branch, request.form['adress'], name))
                conn.commit()
                flash("Användaren: " + request.form['adress'] + " har lagts till i systemet", 'success')
            except pymysql.IntegrityError:
                error="Användaren:  " + request.form['adress'] + " finns redan i systemet"
                flash(error, 'error') 
            
            return redirect(url_for('auth.adminLoggedIn'))

    else:          
        stmt="DELETE FROM Users WHERE Email=(%s)"
        conn=db.get_db()
        cursor=conn.cursor()
        try:
            if(ifPresentEmail(request.form['adress'])):
                cursor.execute(stmt, request.form['adress'])
                conn.commit()
                error="Användaren: " + request.form['adress'] + " togs bort"
                flash(error, 'sucess')
            else:
                error="Användaren: " + request.form['adress'] + " finns inte i systemet"
                flash(error, 'error')
        except pymysql.IntegrityError:
                error="Användaren: " + request.form['adress'] + " finns inte i systemet"
                flash(error, 'error')

    return redirect(url_for('auth.adminLoggedIn'))


@bp.route("/changePassword", methods=('GET', 'POST'))
def changePassword():
    if(request.form['pass1']==request.form['pass2']):
        stmt="UPDATE Admins SET Password = %s WHERE (Username = %s)"
        conn=db.get_db()
        cursor=conn.cursor()
        cursor.execute(stmt, (request.form['pass1'], session['user_id']))
        conn.commit()
        flash("Lösenordsbytet lyckades.", 'sucess')
    else :
        error="Lösenorden matchade ej"
        flash(error,'error')
        
    return redirect(url_for('auth.adminLoggedIn'))



# Checks if admin is logged in. If not - /admin is rendered
@bp.route("/adminIndex", methods=('GET', 'POST'))
def adminLoggedIn():
    if request.method == 'GET':
        # Detta måste ändras, finns nog bättre sätt att kolla på om man är admin. Kanske en checksum eller något
        if session.get('user_id') is None or session['user_id'] != 'Admin':
            session.clear()
            return redirect(url_for('auth.login'))

    if request.method == 'POST':

        #Sökfunktion för specifika användare
        if(request.form.get('text') != " " and request.form.get('text') != None):
            searchbox = request.form.get("text")
            conn=db.get_db()
            cursor=conn.cursor()
            stmt= "select Name from Users where Name LIKE '{}%' order by Name".format(searchbox)
            cursor.execute(stmt)
            result = cursor.fetchall()
            return jsonify(result)
                
    return render_template("Admin-html/admin-index.html")


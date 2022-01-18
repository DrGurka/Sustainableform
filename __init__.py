import os, sys; sys.path.append(os.path.dirname(os.path.realpath(__file__)))

import db
from flask import Flask

# create and configure the app
app = Flask(__name__, instance_relative_config=True)

app.config.from_mapping(
SECRET_KEY='44ade0bebbe636e0fdaf814f4f82cee812b6598ccb53e1c757f093119430afbe')

db.init_app(app)

import common
app.register_blueprint(common.bp)

import questions
app.register_blueprint(questions.bp)

import auth 
app.register_blueprint(auth.bp)

import admin
app.register_blueprint(admin.bp)

# ensure the instance folder exists
try:
    os.makedirs(app.instance_path)
except OSError:
    pass

if __name__ == "__main__":
    app.run()

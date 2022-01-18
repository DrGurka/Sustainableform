import os, sys; sys.path.append(os.path.dirname(os.path.realpath(__file__)))

import db
from flask import Flask

# create and configure the app
project_root = os.path.dirname(os.path.realpath('__file__'))
template_path = os.path.join(project_root, 'templates')
static_path = os.path.join(project_root, 'static')
app = Flask(__name__, template_folder=template_path, static_folder=static_path, instance_relative_config=True)

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

def create_app(test_config=None):

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    

    return app
    
create_app()
import os, sys; sys.path.append(os.path.dirname(os.path.realpath(__file__)))

import db
from flask import Flask

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)

    app.config.from_mapping(
    SECRET_KEY='44ade0bebbe636e0fdaf814f4f82cee812b6598ccb53e1c757f093119430afbe',
    MYSQL_DATABASE_USER = 'flask',
    MYSQL_DATABASE_PASSWORD = '827ccb0eea8a706c4c34a16891f84e7b',
    MYSQL_DATABASE_DB = 'Sustainableform',
    MYSQL_DATABASE_HOST = '92.205.13.101')

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

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

    return app

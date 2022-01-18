import os
from . import db
from flask import Flask


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)

    app.config.from_mapping(
        SECRET_KEY='44ade0bebbe636e0fdaf814f4f82cee812b6598ccb53e1c757f093119430afbe'
    )
    db.init_app(app)

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

    from . import common
    app.register_blueprint(common.bp)

    from . import questions
    app.register_blueprint(questions.bp)

    from . import auth 
    app.register_blueprint(auth.bp)

    from . import admin
    app.register_blueprint(admin.bp)

    return app
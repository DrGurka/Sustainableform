import functools
from . import db
from flask import (
    Blueprint, g, render_template, redirect, render_template, request, session, url_for
)

bp = Blueprint('admin', __name__, url_prefix='/admin')

@bp.route("/mailing")
def mailingPage():
    return render_template("Admin-html/admin-mail-list.html")


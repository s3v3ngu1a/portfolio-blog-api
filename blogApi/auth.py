import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash
from blogApi.db import get_db
from helpers import auth_helper, key_generator


bp = Blueprint('auth', __name__, url_prefix='/auth')


@bp.route('/register', methods=('GET', 'POST'))
def register():
    print(auth_helper.register_validator())
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        db = get_db()
        error = None

        if not username:
            error = 'Username is required.'
        elif not email:
            error = 'Email is required.'
        if error is None:
            try:
                api_id, api_key = generate_api_keys(username, email)
                db.execute(
                    "INSERT INTO user (username, user_email, user_id, user_secret, show_cred) VALUES (?, ?, ?, ?)",
                    (username, email,generate_password_hash(api_id), generate_password_hash(api_key), 1),
                )
                db.commit()
            except db.IntegrityError:
                error = f"User {username} is already registered."
            else:
                return redirect(url_for("auth.success_register"))
        flash(error)

    return render_template('auth/register.html')


@bp.route('/success_register', methods=['GET'])
def success_register():
    pass


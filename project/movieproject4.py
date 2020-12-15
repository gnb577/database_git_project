from flask import Flask 
import sqlite3
from flask import Blueprint, request, render_template, flash, redirect, url_for, session
from flask import current_app as current_app
from flask_sqlalchemy import SQLAlchemy
from instagram import getfollowedby, getname


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///login.db'
login_db = SQLAlchemy(app)

class User(login_db.Model):
	""" Create user table"""
	id = login_db.Column(login_db.Integer, primary_key=True)
	username = login_db.Column(login_db.String(80), unique=True)
	password = login_db.Column(login_db.String(80))

	def __init__(self, username, password):
		self.username = username
		self.password = password

@app.route('/')
@app.route('/cinema')
def showMenu():
    return render_template('/cinema.html')

@app.route('/cinema/theater')
@app.route('/cinema/theater/<string:t_name>') 
def showTheater(t_name=None):
    if t_name:
        db =sqlite3.connect('./movie_cinema.db')
        db.row_factory = sqlite3.Row
        items = db.execute(
            'SELECT theater_name,movie_name FROM Screen_movies WHERE theater_name = ?',(t_name,)
        ).fetchall()
        db.close()
        return render_template('/theater_movie.html',items = items)

    else:
        db =sqlite3.connect('./movie_cinema.db')
        db.row_factory = sqlite3.Row
        items = db.execute(
            'SELECT name,location FROM Theater'
        ).fetchall()
        db.close()

        return render_template('/theater.html',items = items)


  



@app.route('/cinema/movie')
def showMovie():
    return render_template('/movie.html')



@app.route('/cinema/reservation')
def showReservation():
    return render_template('/reservation.html')

@app.route('/cinema/log')
def showLog():
    return render_template('/log.html')

@app.route('/cinema/register')
def showRegister():
    return render_template('/register.html')

@app.route('/cinema/login', methods=['GET','POST'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
        # 요청에 대한 응답인 html의 입력 폼을 던져줌.
    else:
        uid = request.form.get('uid')
        upw = request.form.get('upw')
        return '아이디는 : %s, 비밀번호는 : %s' % (uid, upw)
    return "login page"




if __name__ == '__main__':
    app.debug= True
    app.run(host='127.0.0.1',port=5000)
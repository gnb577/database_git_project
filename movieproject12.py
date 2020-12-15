
from flask import Flask 
import sqlite3
from flask import Blueprint, request, render_template, flash, redirect, url_for, session
from flask import current_app as current_app
from flask_sqlalchemy import SQLAlchemy



app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///login.db'
db = SQLAlchemy(app)



class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    userid = db.Column(db.String(80), unique=True)
    password = db.Column(db.String(80))
    username = db.Column(db.String(80))
    age =  db.Column(db.String(80))
    sex = db.Column(db.String(80))

    def __init__(self, userid, password,username,age, sex):
        self.userid = userid
        self.password = password
        self.username = username
        self.age = age
        self.sex = sex


@app.route('/')
@app.route('/cinema',methods = ['POST','GET'])
def showMenu():
    return render_template('/cinema.html')    

@app.route('/cinema/theater')
@app.route('/cinema/theater/<string:t_name>') 
def showTheater(t_name = None):
    if t_name:
        db2 =sqlite3.connect('./movie_cinema.db')
        db2.row_factory = sqlite3.Row
        items = db2.execute(
            'SELECT movie_name FROM Screen_movies WHERE theater_name = ?',(t_name,)
        ).fetchall()
        db2.close()
        return render_template('/theater_movie.html',items = items,t_name = t_name)
    else:
        db2 =sqlite3.connect('./movie_cinema.db')
        db2.row_factory = sqlite3.Row
        items = db2.execute(
            'SELECT name,location FROM Theater'
        ).fetchall()
        db2.close()

        return render_template('/theater.html',items = items)


@app.route('/cinema/movie')  
@app.route('/cinema/movie/<string:m_name>')
def showMovie(m_name = None):
    if m_name:
        db5 =sqlite3.connect('./movie_cinema.db')
        db5.row_factory = sqlite3.Row
        items = db5.execute(
            'SELECT name,genre,grade,time,year FROM Movie WHERE name = ?',(m_name,)
        ).fetchall()
        db5.close()
        return render_template('/movie_movie.html',items = items, m_name = m_name)
    
    else:
        db3 =sqlite3.connect('./movie_cinema.db')
        db3.row_factory = sqlite3.Row
        items = db3.execute(
            'SELECT name,genre,grade,time,year FROM Movie'
        ).fetchall()
        db3.close()
        return render_template('/movie.html',items = items)



@app.route('/cinema/theater/movie_search',methods = ['POST','GET'])
def showTheater2():
    if request.method == 'POST':
        movie_movie_name = request.form['movie_movie_name']
        db4 =sqlite3.connect('./movie_cinema.db')
        db4.row_factory = sqlite3.Row
        items = db4.execute(
            'SELECT theater_name FROM Screen_Movies WHERE movie_name =?',(movie_movie_name,)
        ).fetchall()
        return render_template('/movie_search.html',items = items, movie_name = movie_movie_name)
    

@app.route('/cinema/movie/movie_info',methods = ['POST','GET'])  
def showMovie2():
    if request.method == 'POST':
        movie_movie_name2 = request.form['movie_movie_name2']
        db6 =sqlite3.connect('./movie_cinema.db')
        db6.row_factory = sqlite3.Row
        items = db6.execute(
            'SELECT name,genre,grade,time,year FROM Movie WHERE name =?',(movie_movie_name2,)
        ).fetchall()
        return render_template('/movie_movie.html',items = items, movie_name = movie_movie_name2)


@app.route('/cinema/reservation')
def showReservation():
    return render_template('/reservation.html')

@app.route('/cinema/log')
def showLog():
    return render_template('/log.html')

@app.route('/cinema/register', methods=['GET', 'POST'])
def showRegister():
	"""Register Form"""
	if request.method == 'POST':
		new_user = User(userid=request.form['userid'], password=request.form['password'],username=request.form['username'],age=request.form['age'],sex=request.form['sex'])
		db.session.add(new_user)
		db.session.commit()
		return redirect(url_for('showMenu'))
	return render_template('register.html')



@app.route('/cinema/login', methods=['GET','POST'])
def login():
	"""Login Form"""
	if request.method == 'GET':
		return render_template('login.html')
	else:
		uid = request.form['userid']
		passw = request.form['password']
		try:
			data = User.query.filter_by(userid=uid, password=passw).first()
			if data is not None:
				session['logged_in'] = True
				return redirect(url_for('showMenu'))
			else:
				return 'Dont Login'
		except:
			return "Dont2 Login"

            
@app.route("/cinema/logout")
def logout():
	"""Logout Form"""
	session['logged_in'] = False
	return redirect(url_for('showMenu'))



if __name__ == '__main__':
    app.debug= True
    db.create_all()
    app.secret_key ="123"
    app.run(host='127.0.0.1',port=5000)
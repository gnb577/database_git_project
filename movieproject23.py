from flask import Flask 
import sqlite3
from flask import Blueprint, request, render_template, flash, redirect, url_for, session
from flask import current_app as current_app
from flask_sqlalchemy import SQLAlchemy



app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///login.db'
db = SQLAlchemy(app)
db10 = SQLAlchemy(app)



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
@app.route('/cinema')
@app.route('/cinema/<data>')
def showMenu(data=None):
    if not session.get('logged_in'):
        return render_template('/cinema.html')    
    else:
        if data:
            return render_template('/cinema.html', data = data)
        else:
            return redirect(url_for('logout'))


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
                print("hello")
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


@app.route('/cinema/movie/order',methods = ['POST','GET'])
def showMovie3():
    if request.method == 'POST':
        data = request.form.get("order")
        db20 =sqlite3.connect('./movie_cinema.db')
        db20.row_factory = sqlite3.Row
        if data == "name":
            items = db20.execute(
                'SELECT name,genre,grade,time,year FROM Movie ORDER BY name'
            ).fetchall()
        if data == "genre":
            items = db20.execute(
                'SELECT name,genre,grade,time,year FROM Movie ORDER BY genre'
            ).fetchall()
        if data == "grade":
            items = db20.execute(
                'SELECT name,genre,grade,time,year FROM Movie ORDER BY grade'
            ).fetchall()    
        
        db20.close()
        return render_template('/movie_order.html',items = items)
        

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

@app.route('/cinema/reservation', methods = ['POST','GET'])
@app.route('/cinema/reservation/<data>',methods = ['POST','GET'])
def showReservation(data=None):
    if request.method == 'POST':
        movie_name = request.form['movie_name']
        theater = request.form['theater']
        score = request.form['score']
        ticketing_time= request.form['ticketing_time']
        seat = request.form['seat']
        db12 = sqlite3.connect('./movie_cinema.db')
        db12.row_factory = sqlite3.Row
        db11 = sqlite3.connect('./movie_cinema.db')
        data2 = [data ,movie_name,theater,score,ticketing_time,seat]
        db11.execute('insert into Reservation values (?,?,?,?,?,?)',(*data2,))
        db11.commit()
        db11.close()
        print('holl')
        return redirect(url_for('showMenu',data = data))
    else:    
        print('hi')
        return render_template('/reservation.html',data = data)

@app.route('/cinema/log')
@app.route('/cinema/log/<data>')
def showLog(data=None):
        if data == None:
            return "hello"
        db12 =sqlite3.connect('./movie_cinema.db')
        db12.row_factory = sqlite3.Row
        items = db12.execute(
            'SELECT movie_name,theater_name,score,ticketing_time,seat FROM Reservation WHERE member_id = ?',(data,)
        ).fetchall()
        db12.close()
        return render_template('/log.html',items = items,login_id = data)

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
				return redirect(url_for('showMenu',data = uid))                
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
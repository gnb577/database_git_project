from flask import Flask 
import sqlite3
from flask import Blueprint, request, render_template, flash, redirect, url_for
from flask import current_app as current_app

app = Flask(__name__)

@app.route('/')
@app.route('/cinema')
def showMenu():
    db =sqlite3.connect('./database/movie_cinema2.db')
    db.row_factory = sqlite3.Row
    items = db.execute(
        'SELECT name,location FROM Theater'
    ).fetchall()
    
    db.close()
    return render_template('/cinema.html',items = items,the_title = 'hello man!')


@app.route('/test')
def showtest():
    return render_template('/test.html')


@app.route('/login', methods=['GET','POST'])
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
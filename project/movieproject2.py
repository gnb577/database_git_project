from flask import Flask 
import sqlite3

app = Flask(__name__)

@app.route('/')
@app.route('/cinema')
def showMenu():
    db =sqlite3.connect('movie_cinema2.db')
    db.row_factory = sqlite3.Row
    items = db.execute(
        'SELECT name FROM Theater'
    ).fetchall()
    output = ""
    for item in items:
        output += item['name'] + '<br>'
    db.close()
    return output

if __name__ == '__main__':
    app.debug= True
    app.run(host='127.0.0.1',port=5000)
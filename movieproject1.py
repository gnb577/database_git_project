from flask import Flask 
import sqlite3

app = Flask(__name__)

@app.route('/')
@app.route('/cinema/')
def showMainpage():

@app.route('/cinema/theater/')
def showTheaterpage():

@app.route('/cinema/movie/')
def showMoviepage():

@app.route('/cinema/movie/<string:name>/')
def showMovie():    

@app.route('/cinema/reservation/')
def showReservationpage():

@app.route('/cinema/customerlog/')
def showCustomerlogpage(): 
   
  

if __name__ == "__main__":
    app.debug = True
    app.run(host = "127.0.0.1", port = 5000)
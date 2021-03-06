DROP TABLE IF EXISTS Theater;
DROP TABLE IF EXISTS Screen_movies;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Screen;
DROP TABLE IF EXISTS Reserve;
DROP TABLE IF EXISTS New_Reserve;


CREATE TABLE Theater (
  name VARCHAR(250) NOT NULL,
  location  VARCHAR(250) NOT NULL,
  tel VARCHAR(250) NOT NULL,
  address VARCHAR(250) NOT NULL,
  PRIMARY KEY(name)
);

CREATE TABLE Screen_movies   (
  theater_name VARCHAR(250)  NOT NULL, 
  movie_name VARCHAR(250) NOT NULL, 
  PRIMARY KEY (theater_name,movie_name),
  FOREIGN KEY(theater_name) REFERENCES Theater(name),
  ON DELETE SET DEFAULT ON UPDATE CASCADE
  FOREIGN KEY(movie_name) REFERENCES Movie(name),
  ON DELETE SET DEFAULT ON UPDATE CASCADE

);

CREATE TABLE Movie (
  name VARCHAR(250) NOT NULL,
  genre  VARCHAR(250) NOT NULL,
  grade INTEGER NOT NULL,
  time INTEGER NOT NULL,
  year INTEGER NOT NULL,
  PRIMARY KEY(name)
);

CREATE TABLE Customer (
  name VARCHAR(250) NOT NULL,
  age Integer NOT NULL,
  sex VARCHAR(250) NOT NULL,
  PRIMARY KEY(name)
);


CREATE TABLE Screen (
  movie_name VARCHAR(250) NOT NULL, 
  theater_name VARCHAR(250) NOT NULL,
 PRIMARY KEY(movie_name,theater_name),
 FOREIGN KEY(movie_name) REFERENCES Movie(name),
 ON DELETE SET DEFAULT ON UPDATE CASCADE,
 FOREIGN KEY(theater_name) REFERENCES Theater(name),
 ON DELETE SET DEFAULT ON UPDATE CASCADE
);


CREATE TABLE Reserve (
  customer_name VARCHAR(250) NOT NULL,
  theater_name VARCHAR(250) NOT NULL,
  movie_name VARCHAR(250) NOT NULL,
  score Integer NOT NULL,
  ticketing_time TIME NOT NULL,
  seat_num VARCHAR(250) NOT NULL,
  PRIMARY KEY(customer_name,theater_name,movie_name),
  FOREIGN KEY(customer_name) REFERENCES Customer(name),
  ON DELETE SET DEFAULT ON UPDATE CASCADE,
  FOREIGN KEY(theater_name) REFERENCES Theater(name),
  ON DELETE SET DEFAULT ON UPDATE CASCADE,
  FOREIGN KEY(movie_name) REFERENCES Movie(name),
  ON DELETE SET DEFAULT ON UPDATE CASCADE
);


CREATE TABLE New_Reserve (
  customer_name VARCHAR(250) NOT NULL,
  theater_name VARCHAR(250) NOT NULL,
  movie_name VARCHAR(250) NOT NULL,
  score Integer NOT NULL,
  ticketing_time TIME NOT NULL,
  seat_num VARCHAR(250) NOT NULL,
  age INTEGER NOT NULL,
  sex VARCHAR(250) NOT NULL,
  PRIMARY KEY(customer_name,theater_name,movie_name),
  FOREIGN KEY(customer_name) REFERENCES Customer(name),
  ON DELETE SET DEFAULT ON UPDATE CASCADE,
  FOREIGN KEY(theater_name) REFERENCES Theater(name),
  ON DELETE SET DEFAULT ON UPDATE CASCADE,
  FOREIGN KEY(movie_name) REFERENCES Movie(name),
  ON DELETE SET DEFAULT ON UPDATE CASCADE
);


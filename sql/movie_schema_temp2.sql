DROP TABLE IF EXISTS Theater;
DROP TABLE IF EXISTS Screen_movies;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Member;


CREATE TABLE Theater (
  name VARCHAR(80) NOT NULL,
  location  VARCHAR(80) NOT NULL,
  tel VARCHAR(80) NOT NULL,
  address VARCHAR(80) NOT NULL,
  PRIMARY KEY(name)
);


CREATE TABLE Movie (
  name VARCHAR(80) NOT NULL,
  genre  VARCHAR(80) NOT NULL,
  grade INTEGER NOT NULL,
  time INTEGER NOT NULL,
  year INTEGER NOT NULL,
  PRIMARY KEY(name)
);

CREATE TABLE Member (
  id VARCHAR(80),
  password VARCHAR(80) NOT NULL,
  name VARCHAR(80) NOT NULL,
  age VARCHAR(80) NOT NULL,
  sex VARCHAR(80) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Screen_movies   (
  theater_name VARCHAR(80)  NOT NULL, 
  movie_name VARCHAR(80) NOT NULL, 
  PRIMARY KEY (theater_name,movie_name),
  FOREIGN KEY(theater_name) REFERENCES Theater(name)ON DELETE SET DEFAULT ON UPDATE CASCADE,
  FOREIGN KEY(movie_name) REFERENCES Movie(name) ON DELETE SET DEFAULT ON UPDATE CASCADE
);


CREATE TABLE Reservation   (
  member_id VARCHAR(80),
  movie_name VARCHAR(80), 
  theater_name VARCHAR(80), 
  score VARCHAR(80),
  ticketing_time VARCHAR(80),
  seat VARCHAR(80),
  PRIMARY KEY (member_id,movie_name,theater_name),
  FOREIGN KEY(movie_name) REFERENCES Movie(name) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  FOREIGN KEY(theater_name) REFERENCES Theater(name)ON DELETE SET DEFAULT ON UPDATE CASCADE
);
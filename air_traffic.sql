-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  countryid INTEGER REFERENCES countries (id)
);

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  assignment TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passengerid INTEGER REFERENCES passengers (id),
  seatid INTEGER REFERENCES seats (id),
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airlineid INTEGER REFERENCES airlines (id),
  from_cityid INTEGER REFERENCES cities (id),
  from_countryid INTEGER REFERENCES countries (id),
  to_cityid INTEGER REFERENCES cities (id),
  to_countryid INTEGER REFERENCES countries (id)
);


INSERT INTO passengers (first_name, last_name)
VALUES ('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbles');

INSERT INTO airlines (name)
VALUES ('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO countries (name)
VALUES ('United States'),
('Japan'),
('France'),
('UAE'),
('Brazil'),
('Mexico'),
('Morocco'),
('Chile');

INSERT INTO cities (name, countryid)
VALUES ('Washington DC', 1),
('Tokyo', 2),
('Las Vegas', 1),
('Paris', 3);

INSERT INTO seats (assignment)
VALUES ('1A'),
('2B'),
('3C'),
('4D'),
('11A');

INSERT INTO tickets (passengerid, seatid, departure, arrival, airlineid, from_cityid, from_countryid, to_cityid, to_countryid)
VALUES (1,1,'2018-04-08 09:00:00', '2018-04-08 12:00:00',1,1,1,1,1),
(2,2,'2018-04-08 09:00:00', '2018-04-08 12:00:00',2,3,2,2,4);
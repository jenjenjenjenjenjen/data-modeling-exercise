DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    ranking INT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    teamid INTEGER REFERENCES teams (id)
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams (id),
    team2_id INTEGER REFERENCES teams (id),
    score INTEGER
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    matchid INTEGER REFERENCES matches (id),
    playerid INTEGER REFERENCES players (id)
);

CREATE TABLE referees_matches (
    id SERIAL PRIMARY KEY,
    refereeid INTEGER REFERENCES referees (id),
    matchid INTEGER REFERENCES matches (id)
);
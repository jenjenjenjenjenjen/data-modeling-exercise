-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs_artists (
  id SERIAL PRIMARY KEY,
  songid INTEGER REFERENCES songs (id),
  artistid INTEGER REFERENCES artists (id)
);

CREATE TABLE songs_albums (
  id SERIAL PRIMARY KEY,
  songid INTEGER REFERENCES songs (id),
  albumid INTEGER REFERENCES albums (id)
);

CREATE TABLE songs_producers (
  id SERIAL PRIMARY KEY,
  songid INTEGER REFERENCES songs (id),
  producerid INTEGER REFERENCES producers (id)
);




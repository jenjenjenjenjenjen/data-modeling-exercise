DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    regionid INTEGER REFERENCES regions (id)
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT NOT NULL,
    userid INTEGER REFERENCES users (id),
    location TEXT,
    regionid INTEGER REFERENCES regions (id)
);

CREATE TABLE posts_categories (
    id SERIAL PRIMARY KEY,
    categoryid INTEGER REFERENCES categories (id),
    postid INTEGER REFERENCES posts (id)
);
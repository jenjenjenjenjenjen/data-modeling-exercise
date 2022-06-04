DROP DATABASE IF EXISTS medical_centers;

CREATE DATABASE medical_centers;

\c medical_centers

CREATE TABLE centers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT NOT NULL
);

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone_number TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE centers_doctors (
    id SERIAL PRIMARY KEY,
    doctorid INTEGER REFERENCES doctors (id),
    centerid INTEGER REFERENCES centers (id)
);

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    doctorid INTEGER REFERENCES doctors (id),
    patientid INTEGER REFERENCES patients (id)
);

CREATE TABLE patients_diseases (
    id SERIAL PRIMARY KEY,
    patientid INTEGER REFERENCES patients (id),
    diseaseid INTEGER REFERENCES diseases (id)
);


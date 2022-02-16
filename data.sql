
/* store in database sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts)
VALUES (1,'Agumon', date '2020-02-03',10.23,TRUE, 0);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts)
VALUES (2,'Gabumon', date '2018-11-15',8,TRUE, 2);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts)
VALUES (3,'Pikachu', date '2021-01-07',15.04,FALSE, 1);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts)
VALUES (4,'Devimon', date '2017-05-12',11,TRUE, 5);

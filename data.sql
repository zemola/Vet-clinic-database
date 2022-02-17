
/* store in database sample data. */

INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (1,'Agumon', date '2020-02-03',10.23,TRUE, 0);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (2,'Gabumon', date '2018-11-15',8,TRUE, 2);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (3,'Pikachu', date '2021-01-07',15.04,FALSE, 1);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (4,'Devimon', date '2017-05-12',11,TRUE, 5);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES(5,'Charmander', date '2020-2-8',-11,FALSE,0);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES(6,'Plantmon', date '2022-11-15',-5.7,TRUE,2);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES(7,'Squirtle', date '1993-4-2',-12.13,TRUE,3);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES(8,'Angemon', date '2005-5-12',-45,TRUE,1);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES(9,'Boarmon', date '2005-5-7',20.4,TRUE,7);
INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES(10,'Blossom', date '1998-10-13',17,TRUE,3);

/* Insert data into the owners table: */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert data into the species table */
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

/* Modify inserted animals so it includes the species_id value */
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

/* Modify your inserted animals to include owner information (owner_id) */
-- Sam Smith owns Agumon.
UPDATE animals SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');
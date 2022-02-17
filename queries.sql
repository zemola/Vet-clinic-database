/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
-- Find all animals whose name ends in "mon".
SELECT * from animals WHERE name LIKE '%mon';
-- List the name of all animals born between 2016 and 2019.
SELECT name from animals where date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name 
FROM animals
WHERE neutered = 'true' AND escape_attempts < 3;
-- List date of birth of all animals named either "Agumon" or "Pikachu".
SELECT name from animals where name='Agumon' or name='Pikachu';
-- List name and escape attempts of animals that weigh more than 10.5kg.
SELECT name,escape_attempts from animals where weight_kg>10.5;
-- Find all animals that are neutered.
SELECT *
FROM animals 
WHERE neutered ='true';
-- Find all animals not named Gabumon.
SELECT *
FROM animals 
WHERE NOT name ='Gabumon';
-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg
SELECT *
FROM animals 
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that species columns went back to the state before transaction.
BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon';
SELECT * FROM animals;
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals 
SET species = 'pokemon'
WHERE species is NULL;
SELECT * FROM animals;
-- Commit the transaction.
COMMIT;
SELECT * FROM animals;

--  Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE  FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth>'2022-01-01';
SAVEPOINT borndate;
UPDATE animals
SET weight_kg = weight_kg*-1;
ROLLBACK TO borndate;
UPDATE animals SET weight_kg = weight_kg*-1
WHERE weight_kg<0;
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(escape_attempts)
FROM animals
WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT 
neutered,MAX(escape_attempts)
FROM animals
GROUP BY neutered
-- What is the minimum and maximum weight of each type of animal?
SELECT MIN(weight_kg),MAX(weight_kg) FROM animals;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

/* Write queries (using JOIN) to answer the following questions */
-- What animals belong to Melody Pond?
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name='Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id=species.id WHERE species_id=1;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name, full_name FROM owners LEFT JOIN animals ON animals.owner_id=owners.id;

-- How many animals are there per species?
SELECT species.name, COUNT(*) from animals JOIN species ON animals.species_id=species.id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id LEFT JOIN species ON animals.species_id = species.id 
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owner_id=owners.id 
GROUP BY owners.full_name ORDER BY total DESC LIMIT 1;

-- NOT PART OF THE REQUIREMENT - FOR REFERENCE
-- Returns all owners and animals total they own
SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owner_id=owners.id 
GROUP BY owners.full_name;
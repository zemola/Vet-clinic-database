/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name varchar(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
    species varchar(100)
);


/* Create a table named owners */
CREATE TABLE owners(
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   full_name varchar (250),
   age
);

/* Create a table named species */
CREATE TABLE species(
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   name varchar (250) NOT NULL
);

/* Modify animals table */
ALTER TABLE animals ADD PRIMARY KEY (id);

/* Remove column species */
ALTER TABLE animals DROP COLUMN species;

/* Add column species_id which is a foreign key referencing species table */
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

/* Add column owner_id which is a foreign key referencing the owners table */
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

--Create a table named vets 
CREATE TABLE vets(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   age INT,
   date_of_graduation DATE
   );
   
--There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it.
-- Create a "join table" called specializations to handle this relationship.
CREATE TABLE specializations (
    species_id int,
    vets_id int,
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);
--There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals.
-- Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
CREATE TABLE visits (
    animals_id int,
    vets_id int,
    date_of_visit date,
    CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);
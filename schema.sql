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
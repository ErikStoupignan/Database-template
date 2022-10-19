/* Database schema to keep the structure of entire database. */

/* Project 1 */
CREATE TABLE animals(
id            INT GENERATED ALWAYS AS IDENTITY,
name    VARCHAR(250),
date_of_birth           date,
escape_attempts    int,
neutered     boolean,
weight_kg decimal,
PRIMARY KEY(id)
);

/* Project 2 */
ALTER TABLE animals ADD species VARCHAR(250);

/* Project 3 */ 
CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY, 
full_name VARCHAR(250), 
age INT,
PRIMARY KEY(id)
);

CREATE TABLE species(
id INT GENERATED ALWAYS AS IDENTITY, 
full_name VARCHAR(250), 
PRIMARY KEY(id)
);

ALTER TABLE animals ADD owners_id VARCHAR(250);
ALTER TABLE animals ADD species_id VARCHAR(250);

ALTER TABLE species
ADD CONSTRAINT fk_species
FOREIGN KEY(id)
REFERENCES animals(id)
ON DELETE CASCADE;

UPDATE animals SET species_id='Digimon' WHERE name LIKE '%mon';
UPDATE animals SET species_id='Pokemon' WHERE name NOt LIKE '%mon';

UPDATE animals SET owners_id='1' WHERE name = 'Agumon';
UPDATE animals SET owners_id='2' WHERE name = 'Gabumon'OR name = 'Pikachu';
UPDATE animals SET owners_id='3' WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owners_id='4' WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owners_id='5' WHERE name = 'Angemon' OR name = 'Boarmon';

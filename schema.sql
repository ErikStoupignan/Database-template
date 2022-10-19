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

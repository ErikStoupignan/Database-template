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

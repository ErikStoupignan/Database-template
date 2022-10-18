/*Queries that provide answers to the questions from all projects.*/

/*  Project 1   */
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '01-01-2019';
SELECT name FROM animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = True;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.3 and 17.4;

/*  Project 2 - Transaction  */

/* Step 1 */
BEGIN;
UPDATE animals SET species='unspecified';
ROLLBACK;

/* Step 2 */
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE name NOT LIKE '%mon';
COMMIT;

/* Step 3 take a deep breath and... */ 
BEGIN;
DELETE FROM animals;
ROLLBACK;

/* Step 4 */ 
BEGIN;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
SAVEPOINT firstmove;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO firstmove;

/* Step 5 */ 
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg<0;
COMMIT;

/* Queries */
SELECT COUNT( name ) FROM animals;
SELECT COUNT( * ) FROM animals WHERE escape_attempts = 0;
SELECT AVG( weight_kg ) FROM animals;
SELECT neutered, AVG( escape_attempts ) FROM animals GROUP BY neutered ORDER BY AVG DESC LIMIT 1;
SELECT species, MIN( weight_kg ), MAX( weight_kg ) FROM animals GROUP BY species;
SELECT species, AVG( escape_attempts ) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

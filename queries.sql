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

/*   Project 3   */ 

/* Queries */ 

/* challenge 1 */
/* What animals belong to Melody Pond? */
SELECT animals.name, owners.full_name 
FROM owners INNER JOIN animals 
ON owners.id = animals.owners_id
WHERE owners.full_name = 'Melody Pond';

/* challenge 2 */ 
/* List of all animals that are pokemon (their type is Pokemon). */ 
SELECT animals.name, species.name AS species
FROM species INNER JOIN animals 
ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

/* challenge 3 */ 
/* List all owners and their animals, remember to include those that don't own any animal. */
SELECT owners.full_name, animals.name
FROM animals RIGHT JOIN owners
ON owners.id = animals.owners_id;

/* challenge 4 */ 
/* How many animals are there per species? */
SELECT species.name AS Species, count(species_id) AS Total
FROM animals INNER JOIN species
ON species.id = animals.species_id
GROUP BY species.name;

/* challenge 5 */ 
/* List all Digimon owned by Jennifer Orwell. */
SELECT owners.full_name AS owner, animals.name AS pet
FROM animals
JOIN owners ON owners.id = animals.owners_id
JOIN species ON species.id = animals.species_id
WHERE owners.full_name = 'Jennifer Orwell ' AND species.name = 'Digimon';

/* challenge 6 */ 
/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT owners.full_name, animals.name AS GoodAnimal
FROM animals
INNER JOIN owners ON owners.id = animals.owners_id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

/* challenge 7 */ 
/* Who owns the most animals? */
SELECT owners.full_name AS MostAnimal, count(*)
FROM animals
INNER JOIN owners ON animals.owners_id = owners.id
GROUP BY owners.full_name
ORDER BY count DESC LIMIT 1;


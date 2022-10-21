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

/* Project 4 */ 

/* Who was the last animal seen by William Tatcher? */
SELECT animals.name AS animal, vets.name, date_of_visit
FROM visits
JOIN animals ON animals_id = animals.id
JOIN vets on vet_id  = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC limit 1;

/* How many different animals did Stephanie Mendez see? */
SELECT animals.name AS Total, COUNT(animals.name)
FROM visits
JOIN animals ON animals_id = animals.id
JOIN vets ON vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY animals.name;

/* List all vets and their specialties, including vets with no specialties. */
SELECT vets.name, species.name
FROM vets
LEFT JOIN specializations ON vet_id = vets.id
LEFT JOIN species ON species.id = species_id;


/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT animals.name , date_of_visit, vets.name
FROM visits
JOIN vets ON vet_id = vets.id
JOIN animals ON animals_id = animals.id
WHERE vets.name = 'Stephanie Mendez' 
AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

/* What animal has the most visits to vets? */
SELECT animals.name, COUNT(date_of_visit)
FROM visits
JOIN animals ON animals_id = animals.id
GROUP BY animals.name
ORDER BY count DESC LIMIT 1;

/* Who was Maisy Smith's first visit? */
SELECT animals.name, date_of_visit, vets.name
FROM visits
JOIN animals ON animals_id = animals.id
JOIN vets ON vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */
SELECT animals.*, vets.*
FROM visits
JOIN animals ON animals_id = animals.id
join vets on vet_id = vets.id
ORDER BY date_of_visit DESC LIMIT 1;

/* How many visits were with a vet that did not specialize in that animal's species? */
SELECT COUNT(*), vets.name
FROM vets
JOIN visits ON visits.vet_id = vets.id
JOIN animals ON animals.id = visits.animals_id
LEFT JOIN specializations ON specializations.vet_id = vets.id
WHERE animals.species_id != specializations.vet_id
AND vets.name != 'Stephanie Mendez'
OR vets.name = 'Maisy Smith'
GROUP by vets.name;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
SELECT species.name, COUNT(date_of_visit)
FROM visits
JOIN animals ON animals_id = animals.id
JOIN species ON species_id = species.id
JOIN vets on vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT DESC;

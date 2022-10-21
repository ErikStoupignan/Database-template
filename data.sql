/* Populate database with sample data. */

/* Project 1 */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23); 
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon',  '2018-11-15', 2, TRUE, 8.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon',  '2017-05-12', 5, TRUE, 11.0);

/* Project 2 */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander','2020-02-08',0, FALSE, -11.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon','2021-11-15',2, TRUE,-5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle','1993-04-02',3, FALSE, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon','2005-06-12',1, TRUE,-45.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon','2005-06-07',7, TRUE, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom','1998-10-13',3, TRUE,17.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto','2022-05-14',4, TRUE,22.0);

/* Project 3 */ 
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell ', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');

/* Project 4 */ 
INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness', 38,'2008-06-08');

INSERT INTO 
 specializations (vet_id, species_id) 
VALUES 
 (1,1),
 (3,1),
 (3,2),
 (4,2);

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-05-04'
FROM  animals, vets
WHERE  animals.name = 'Agumon'
AND  vets.name = 'William Tatcher';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2022-07-22'
FROM  animals, vets
WHERE  animals.name = 'Agumon'
AND  vets.name = 'Stephanie Mendez';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2021-02-02'
FROM  animals, vets
WHERE  animals.name = 'Gabumon'
AND  vets.name = 'Jack Harkness';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-01-05'
FROM  animals, vets
WHERE  animals.name = 'Pikachu'
AND  vets.name = 'Maisy Smith';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-05-14'
FROM  animals, vets
WHERE  animals.name = 'Pikachu'
AND  vets.name = 'Maisy Smith';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-03-08'
FROM  animals, vets
WHERE  animals.name = 'Pikachu'
AND  vets.name = 'Maisy Smith';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2021-05-04'
FROM  animals, vets
WHERE  animals.name = 'Devimon'
AND  vets.name = 'Stephanie Mendez';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2021-02-24'
FROM  animals, vets
WHERE  animals.name = 'Charmander'
AND  vets.name = 'Jack Harkness';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2019-12-21'
FROM  animals, vets
WHERE  animals.name = 'Plantmon'
AND  vets.name = 'Maisy Smith';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-08-10'
FROM  animals, vets
WHERE  animals.name = 'Plantmon'
AND  vets.name = 'William Tatcher';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2021-04-07'
FROM  animals, vets
WHERE  animals.name = 'Plantmon'
AND  vets.name = 'Maisy Smith';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2019-09-29'
FROM  animals, vets
WHERE  animals.name = 'Squirtle'
AND  vets.name = 'Stephanie Mendez';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-10-03'
FROM  animals, vets
WHERE  animals.name = 'Angemon'
AND  vets.name = 'Jack Harkness';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-11-04'
FROM  animals, vets
WHERE  animals.name = 'Angemon'
AND  vets.name = 'Jack Harkness';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2019-01-24'
FROM  animals, vets
WHERE  animals.name = 'Boarmon'
AND  vets.name = 'Maisy Smith';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2019-05-15'
FROM  animals, vets
WHERE  animals.name = 'Boarmon'
AND  vets.name = 'Maisy Smith';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-02-27'
FROM  animals, vets
WHERE  animals.name = 'Boarmon'
AND  vets.name = 'Maisy Smith';
  
INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-08-03'
FROM  animals, vets
WHERE  animals.name = 'Boarmon'
AND  vets.name = 'Maisy Smith';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2020-05-24'
FROM  animals, vets
WHERE  animals.name = 'Blossom'
AND  vets.name = 'Stephanie Mendez';

INSERT INTO  visits (animals_id, vet_id, date_of_visit)
SELECT  animals.id,  vets.id,  '2021-01-11'
FROM  animals, vets
WHERE  animals.name = 'Blossom'
AND  vets.name = 'William Tatcher';

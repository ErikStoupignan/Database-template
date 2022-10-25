/* Try the next queries ---------------------- */
EXPLAIN ANALYZE SELECT COUNT(*) 
FROM visits 
where animal_id = 4;

EXPLAIN ANALYZE SELECT * 
FROM visits 
where vet_id = 2;

EXPLAIN ANALYZE SELECT * 
FROM owners 
where email = 'owner_18327@mail.com';

/* Improve the before queries  ---------------------- */
CREATE INDEX visits_refid ON visits(animal_id);
CREATE INDEX visits_vet_id ON visits(vet_id);
CREATE INDEX owners_email ON owners(email);




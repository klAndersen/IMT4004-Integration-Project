INSERT INTO `ailearninggame`.`tblanimal` VALUES (
null,
"", -- dna/chromosome string for this animal
1, -- boolean (true(1)/false(0)) value indicating whether this animal is alive or dead
0, -- boolean (true(1)/false(0)) value indicating whether this animal has mutated
0, -- the generation that this animal belongs to
0, -- age of animal (in no. of days)
1, -- the probability that this animal will survive (from 0.0 to 1.0)
1, -- the gender of this animal
1, -- the type of species this animal is
1, -- the habitat and food this animal eats
2, -- the status of this animal
null -- foreign key to the parents of this animal ('null' for animals not released)
);


/*
<{animalID: }>,
<{dna: }>,
<{isAlive: }>,
<{mutated: }>,
<{generationNo: }>,
<{age: }>,
<{survability: }>,
<{fk_tblGender: }>,
<{fk_tblAnimalSpecies: }>,
<{fk_tblAnimalLifestyle: }>,
<{fk_tblAnimalStatus: }>,
<{fk_tblParents: }>
*/
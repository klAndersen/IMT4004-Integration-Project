INSERT INTO `ailearninggame`.`tblanimal` VALUES (
null,
"", -- dna/chromosome string for this animal
1, -- boolean (true(1)/false(0)) value indicating whether this animal is alive or dead
0, -- boolean (true(1)/false(0)) value indicating whether this animal has mutated
0, -- the generation that this animal belongs to
0, -- age of animal (in no. of days)
1, -- the probability that this animal will survive (from 0.0 to 1.0)
1, -- the gender of this animal
null, -- foreign key to the parents of this animal ('null' for animals not released)
1, -- foreign key to the animal class of this animal
1, -- foreign key to the food type this animal eats
(Select buildingID from `ailearninggame`.`tblbuilding` where buildingName="Farm") 
-- foreign key to the environment/habitat this animal lives in
);

INSERT INTO `ailearninggame`.`tblbuilding` VALUES (
null,
"Research center"
);

INSERT INTO `ailearninggame`.`tblbuilding` VALUES (
null,
"Sleeping cabins"
);

INSERT INTO `ailearninggame`.`tblbuilding` VALUES (
null,
"Water Tower"
);

INSERT INTO `ailearninggame`.`tblbuilding` VALUES (
null,
"Farm"
);

INSERT INTO `ailearninggame`.`tblbuilding` VALUES (
null,
"Animal Habitat: Forest"
);

INSERT INTO `ailearninggame`.`tblbuilding` VALUES (
null,
"Animal Habitat: Lake"
);

INSERT INTO `ailearninggame`.`tblbuilding` VALUES (
null,
"Animal Habitat: River"
);

INSERT INTO `ailearninggame`.`tblbuilding` VALUES (
null,
"Animal Habitat: Mountain"
);

INSERT INTO `ailearninggame`.`tblbuilding` VALUES (
null,
"Animal Habitat: Grass"
);

INSERT INTO `ailearninggame`.`tblfood` VALUES (
null,
"Plant"
);

INSERT INTO `ailearninggame`.`tblfood` VALUES (
null,
"Meat"
);

INSERT INTO `ailearninggame`.`tblfood` VALUES (
null,
"Human food"
);

INSERT INTO `ailearninggame`.`tblfood` VALUES (
null,
"Insect"
);

INSERT INTO `ailearninggame`.`tblownedfood` VALUES (
null,
1, -- no of this food type that is owned
(Select foodID from `ailearninggame`.`tblfood` where food="Plant"), -- the foreign key to the food type
1 -- foreign key to the game round this food type belongs to
);

INSERT INTO `ailearninggame`.`tblownedfood` VALUES (
null,
1,
(Select foodID from `ailearninggame`.`tblfood` where food="Meat"),
1 
);

INSERT INTO `ailearninggame`.`tblownedfood` VALUES (
null,
1,
(Select foodID from `ailearninggame`.`tblfood` where food="Human food"),
1 
);

INSERT INTO `ailearninggame`.`tblownedfood` VALUES (
null,
1,
(Select foodID from `ailearninggame`.`tblfood` where food="Insect"),
1 
);

INSERT INTO `ailearninggame`.`tblownedbuildings` VALUES (
null,
1, -- no of this building type that is owned
1, -- foreign key to the building type
1 -- foreign key to the game round this building belongs to
);

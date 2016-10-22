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

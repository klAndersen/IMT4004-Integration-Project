INSERT INTO `ailearninggame`.`tblquest` VALUES (
null,
"QuestText", -- quest description
1 -- amount of given rewards received
);

INSERT INTO `ailearninggame`.`tblrewardtype` 
Select 
	null,
    buildingName
    from `ailearninggame`.`tblBuilding`;
    
INSERT INTO `ailearninggame`.`tblrewardtype` 
Select 
	null,
    food
    from `ailearninggame`.`tblfood`;
	
INSERT INTO `ailearninggame`.`tblreward` VALUES (
1, -- the resource id for this reward; e.g. if building of type "Research center", then the value here would be 1
-- a better option would be to just run selects instead of values, but this is just "for show" templates
1, -- Select quest for this reward
1 -- Select the reward for this quest
);

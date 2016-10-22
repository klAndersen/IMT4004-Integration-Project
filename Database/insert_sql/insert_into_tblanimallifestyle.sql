INSERT INTO `ailearninggame`.`tblanimallifestyle`(animallifestyleID, fk_tblBuilding, fk_tblFood)
	Select
		null,
        buildingID,
        foodID
        from `ailearninggame`.`tblbuilding`, 
        `ailearninggame`.`tblfood`;
SELECT f.food, 
b.buildingName, 
aClass.animalClass,
 aSpecies.animalSpecies, 
 g.gender, aStatus.animalStatus, 
  IFNULL(tblparents.father, 0) AS FatherID, IFNULL(tblparents.mother,0) AS FatherID,
 tblAnimal.animalID, tblAnimal.dna, 
 tblAnimal.isAlive, tblAnimal.mutated, tblAnimal.generationNo, 
 tblAnimal.age, tblAnimal.survivability, oa.noOfAnimalsOwned 
 FROM 
 tblOwnedAnimals oa, 
 tblAnimalStatus aStatus, 
 tblGender g, 
 tblAnimalClass aClass, 
 tblAnimalSpecies aSpecies, 
 tblAnimalLifeStyle als, 
 tblBuilding b, 
 tblFood f, 
 tblGameRound gr, 
 tblPlayer player,
 tblAnimal  
 LEFT OUTER JOIN tblparents ON tblAnimal.fk_tblParents = tblparents.parentID 
 WHERE player.playerID = gr.fk_tblPlayer 
 AND oa.fk_tblGameRound = gr.gameRoundID 
 AND oa.fk_tblAnimal = tblAnimal.animalID 
 AND tblAnimal.fk_tblGender = g.genderID 
 AND tblAnimal.fk_tblAnimalSpecies = aSpecies.animalSpeciesID 
 AND tblAnimal.fk_tblAnimalLifeStyle = als.animalLifeStyleID 
 AND tblAnimal.fk_tblAnimalStatus = aStatus.animalStatusID 
 AND aSpecies.fk_tblAnimalClass = aClass.animalClassID 
 AND als.fk_tblBuilding = b.buildingID 
 AND als.fk_tblFood = f.foodID;
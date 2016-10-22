DELIMITER $$

-- inserts a new log entry for the new game round that was created
CREATE PROCEDURE InsertNewGameLogEntry (IN fk_tblGameRound INT)
BEGIN
	-- check if entries exists in tblLogtype
	CALL IsTblLogTypeEmpty();
	-- insert entry into tblLog
	INSERT INTO `ailearninggame`.`tbllog` VALUES (
		null,
		NOW(), -- inserts todays date and time
		"Player started a new game.", -- description of the event that occurred
		1, -- fk_tblLogType: new game started
		fk_tblGameRound -- foreign key to tblGameRound
	);
END$$

-- check if tblLogType is empty
CREATE PROCEDURE IsTblLogTypeEmpty()
BEGIN
   -- variable for no. of rows in tbllogtype
   DECLARE rowCount INT;
   -- set value based on rows retrieved
   SELECT COUNT(*) 
   INTO rowCount
   FROM `AiLearningGame`.`tbllogtype`;
   -- if there is no data in tbllogtype, insert some data
	IF (rowCount = 0) THEN
		CALL InsertIntoTblLogType();
	END IF;
END$$

-- procedure inserting values into tblLogtype
CREATE PROCEDURE InsertIntoTblLogType()
BEGIN
	-- ...new game should be first entry....
	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"New Game Round Started!"
	);
	-- 
	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Game Over!"
	);
	-- 
	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Game Round Continued."
	);
	-- 
	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Exited Game."
	);
	-- 
	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Disaster Strikes"
	);
	-- 
	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Question Answered"
	);
	-- 
	INSERT INTO `ailearninggame`.`tbllogtype` VALUES (
		null,
		"Quest completed"
	);
END$$


/*
-- procedure for adding default values when starting new gameround in the tblOwned*
CREATE PROCEDURE InsertNewGameRoundResources (IN fk_tblGameRound INT)
BEGIN

END$$
*/

DELIMITER ;
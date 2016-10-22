DELIMITER #

CREATE DEFINER = CURRENT_USER 
TRIGGER `AiLearningGame`.`TBLPLAYER_AFTER_INSERT` 
AFTER INSERT ON `AiLearningGame`.`tblplayer` 
FOR EACH ROW 
BEGIN 
	INSERT INTO `AiLearningGame`.`tblgameround` VALUES (
	null,
	new.`playerID`, -- fk_tblPlayer
	1, -- game round
	0, -- no. in game days
	0 -- score for this game round
	);
END#

DELIMITER ;
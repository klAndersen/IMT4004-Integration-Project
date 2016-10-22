INSERT INTO `ailearninggame`.`tbllog` VALUES (
null,
CURDATE(), -- inserts todays date
"Player started a new game.", -- description of the event that occurred
(Select logtypeID from `ailearninggame`.`tbllogtype` where logtype="New Game Round Started!"), -- select the relevant logtype
1 -- foreign key to tblGameRound
);

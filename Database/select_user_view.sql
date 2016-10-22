CREATE VIEW `playerProgress` AS
	SELECT DISTINCT u.studNo AS "StudentNo:",
		CONCAT(u.firstName, ' ', u.lAStName) AS "Player Name:",
		IFNULL(gp.score, 0) AS "Game score:",
		IFNULL(g.gameName,"No games played.")  AS "Game:"
	FROM tblUserType ut,    
		tblGameType gt,
		tblUser u 
		LEFT JOIN tblGamesPlayed gp 
			ON gp.fk_pk_tblUser = u.userID     
		LEFT JOIN  tblGames g
				ON gp.fk_pk_tblGames = g.gameID
	WHERE u.fk_tblUserType = ut.userTypeID 
	AND (ut.userType = "Student" OR ut.userType = "Player")
	ORDER BY u.studNo;
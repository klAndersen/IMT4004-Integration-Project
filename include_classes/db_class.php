<?php
	
	/**
	Singleton class handling database operations.
	-----------------------------------------
	@Author: Knut Lucas Andersen
	*/
	class Database extends mysqli {
		//single instance of self shared among all instances
		private static $class_instance = null;
		//database login credentials
		private $dbUser = "s130533"; 
		private $dbPwd = "6YJQyIGY"; 
		private $dbName = "s130533";
		private $dbHost = "mysql.stud.hig.no";
		
		/**
		Class constructor creating connection to database
		*/
		private function __construct() {
			//construct a database connection based on database credentials
			parent::__construct($this->dbHost, $this->dbUser, $this->dbPwd, $this->dbName);
			//did any errors occur?
			if (mysqli_connect_error()) {
				exit('Database connection failed: (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
			} //if
			parent::set_charset('utf-8');
		} //__construct
		
		/**
		Class destructor closing database connection
		(to ensure that resources are freed)
		*/
		public function __destruct() {
			//close database connection
			mysqli_close($this);
		} //__destruct
		
		/** 
		Returns an instance of the class if it exists.
		If it does not exist, it is created and then returned
		*/
		public static function getClassInstance() {
			if (!self::$class_instance instanceof self) {
			 self::$class_instance = new self;
			} //if
			return self::$class_instance;
		} //getClassInstance
		 
		/**
		Function for preventing creation of class duplicates
		*/
		public function __clone() {
			trigger_error('Clone is not allowed.', E_USER_ERROR);
		} //__clone
		 
		/**
		Function for preventing creation of class duplicates
		*/
		public function __wakeup() {
			trigger_error('Deserializing is not allowed.', E_USER_ERROR);
		} //__wakeup
		
		/**
		Retrieves player information based on passed login information
		@param studNo: string - The student no. belonging to the current player
		@param studPwd: string - The password belonging to the current player
		@throw Exception: User not found/invalid login data
		*/
		public function retrievePlayerInformation($studNo, $studPwd) {
			$_SESSION['Player'] = 0;
			//cleanse input for potential sql-injection
			$studNo = $this->real_escape_string($studNo);
			$studPwd = $this->real_escape_string($studPwd);
			//commented out since login isn't active
			// $studPwd = hashPwd($studPwd);
			//query ran against the database
			$query = "SELECT p.playerID, gr.gameRoundNo, gr.noInGameDays, gr.score 
				FROM tblPlayer p, tblGameRound gr 
				WHERE p.studNo = '" . $studNo . "' 
				AND p.password = '" . $studPwd . "' 
				AND gr.fk_tblPlayer = p.playerID;";
			//was query executed?
			if($result = $this->query($query)) {
				//how many rows was returned?
				if($result->num_rows >= 1) {
					//get the last row from result and point to it
					$rowNo = $result->num_rows - 1;					
					$result->data_seek($rowNo);
					//get the row as an associative array
					$row = $result->fetch_assoc();
					$this->setPlayerSession($studNo,$row);
					//free the result resources
					$result->free();					
				} else {
					//user not found/invalid login data, throw exception
					throw new Exception('User with given credentials not found!');
				} //if
			} //if
		} //retrievePlayerInformation
		
		private function setPlayerSession($studNo,$row) {
			$_SESSION['Player'] = array(
					'studNo' => $studNo,
					'score' => $row['score'], 
					'playerID' => $row['playerID'], 
					'gameRoundNo' => $row['gameRoundNo'], 
					'noInGameDays' => $row['noInGameDays']
				);
		} //setPlayerSession
		
		/**
		Function for hashing passwords (future use).
		Added in seperate function in regards to potential
		expansion/update .
		@see http://stackoverflow.com/questions/401656/secure-hash-and-salt-for-php-passwords
		@see http://php.net/manual/en/function.password-hash.php
		*/
		private function hashPwd($pwd) { 
			return password_hash($pwd, PASSWORD_BCRYPT);
		} //hashPwd

		/**
		Retrieves all values from table based on passed parameter.
		NOTE: Remember to call $result->close() when done with the
		results.
		@return: $result || null
		*/
		private function retrieveAllValuesFromTable($tableName) {	 
			//cleanse input for potential sql-injection
			$tableName = $this->real_escape_string($tableName);
			$query = "SELECT * FROM " . $tableName . ";";
			if ($result = $this->query($query)) {
				return $result;
			} //if			
			return null;
		} //retrieveAllValuesFromTable
	} //Database
?>
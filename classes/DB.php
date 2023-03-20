<?php
class DB {
	private $server;
	private $database;
	private $username;
	private $password;

	private $conn;
	private $dsn;

	public function __construct($serv, $db, $uname, $pword) {
		$this->server = $serv;
		$this->database = $db;
		$this->username = $uname;
		$this->password = $pword;

		$this->dsn = "mysql:host={$this->server};dbname={$this->database}";
	}

	public function conn() {
		return $this->conn;
	}

	public function open() {
		if ($this->is_open()) {
			throw new Exception("Try to open database twice");
		}

		$options = array(
			PDO::MYSQL_ATTR_FOUND_ROWS => TRUE,
			PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
		);

		$this->conn = new PDO($this->dsn, $this->username, $this->password, $options);
		return $this->conn;
	}

	public function sql_collect($sql, $params = []) {
		$stmt = $this->conn->prepare($sql);
		$status = $stmt->execute($params);

		$rows_array = [];
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		while ($row !== false) {
			$rows_array[] = $row;
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
		}

		return $rows_array;
	}

	public function is_open() {
		return $this->conn !== null;
	}

	public function close() {
		$this->conn = null;
	}
}
?>


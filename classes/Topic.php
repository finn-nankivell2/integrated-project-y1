<?php
require_once "./classes/DatabaseType.php";

class Topic extends DatabaseType {
	public $id;
	public $name;

	public function  __construct($data) {
		$this->id = $data["id"];
		$this->name = $data["name"];
	}

	public static function find_all() {
		return array_map(
			function($item) { return new Topic($item); },
			self::$db->sql_collect("SELECT * FROM topics")
		);
	}

	public static function find_by_id($id) {
		$conn = self::$db->conn();
		$sql = "SELECT * FROM topics WHERE id = :id";
		$params = [
			":id" => $id
		];

		$stmt = $conn->prepare($sql);
		$status = $stmt->execute($params);

		$author = null;
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		if ($row !== false) {
			$author = new Author($row);
		}

		return $author;
	}
}
?>


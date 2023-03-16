<?php
require_once "./classes/DatabaseType.php";

class Author extends DatabaseType {
	public $id;
	public $name;
	public $email;
	public $personal_website;
	public $bio;

	public function  __construct($data) {
		$this->id = $data["id"];
		$this->name = $data["name"];
		$this->name = $data["name"];
		$this->email = $data["email"];
		$this->personal_website = $data["personal_website"];
		$this->bio = $data["bio"];
	}

	public static function find_all() {
		return array_map(
			function($item) { return new Author($item); },
			self::$db->sql_collect("SELECT * FROM authors")
		);
	}

	public static function find_by_id($id) {
		$conn = self::$db->conn();
		$sql = "SELECT * FROM authors WHERE id = :id";
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


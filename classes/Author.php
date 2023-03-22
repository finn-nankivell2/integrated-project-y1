<?php
require_once "./classes/DatabaseType.php";

class Author extends DatabaseType {
	public $id;
	public $name;
	public $email;
	public $personal_website;
	public $bio;

	public function  __construct($data) {
		$this->id = self::id_exists($data);
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
		$params = [
			":id" => $id
		];

		return array_map(
			function($item) { return new Author($item); },
			self::$db->sql_collect("SELECT * FROM authors WHERE id = :id", $params)
		);
	}
}
?>


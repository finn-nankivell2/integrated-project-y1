<?php
require_once dirname(__FILE__)."/DatabaseType.php";

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
		$r = self::$db->sql_single("SELECT * FROM authors WHERE id = :id", [":id" => $id]);
		$r = ($r !== null) ? new Author($r) : null;
		return $r;
	}
}
?>


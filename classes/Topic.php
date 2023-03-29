<?php
require_once dirname(__FILE__)."/DatabaseType.php";

class Topic extends DatabaseType {
	public $id;
	public $name;

	public function  __construct($data) {
		$this->id = self::id_exists($data);
		$this->name = $data["name"];
	}

	public static function find_all() {
		return array_map(
			function($item) { return new Topic($item); },
			self::$db->sql_collect("SELECT * FROM topics")
		);
	}

	public static function find_by_id($id) {
		$params = [
			":id" => $id
		];

		return array_map(
			function($item) { return new Topic($item); },
			self::$db->sql_collect("SELECT * FROM topics WHERE id = :id", $params)
		);
	}
}
?>


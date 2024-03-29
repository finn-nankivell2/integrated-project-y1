<?php
require_once dirname(__FILE__)."/DatabaseType.php";

class Article extends DatabaseType {
	public $id;
	public $author_id;
	public $title;
	public $sub_heading;
	public $short_headline;
	public $content;
	public $image;
	public $date;
	public $time;
	public $location;
	public $summary;

	public function  __construct($data) {
		$this->id = self::id_exists($data);
		$this->author_id = $data["author_id"];
		$this->title = $data["title"];
		$this->sub_heading = $data["sub_heading"];
		$this->short_headline = $data["short_headline"];
		$this->content = $data["content"];
		$this->image = $data["image"];
		$this->date = $data["date"];
		$this->time = $data["time"];
		$this->location = $data["location"];
		$this->summary = $data["summary"];
	}

	public static function find_all() {
		return array_map(
			function($item) { return new Article($item); },
			self::$db->sql_collect("SELECT * FROM articles")
		);
	}

	public static function find_by_id($id) {
		$r = self::$db->sql_single("SELECT * FROM articles WHERE id = :id", [":id" => $id]);
		$r = ($r !== null) ? new Article($r) : null;
		return $r;
	}

	public static function find_order_by_date() {
		return array_map(
			function($item) { return new Article($item); },
			self::$db->sql_collect("SELECT * FROM articles ORDER BY date")
		);
	}
}
?>


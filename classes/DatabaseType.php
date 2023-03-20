<?php
class DatabaseType {
	protected static $db;

	public static function link_database($db_ref) {
		self::$db = $db_ref;
	}

	protected static function id_exists($data) {
		return array_key_exists("id", $data) ? $data["id"] : null;
	}

	public function properties_as_html() {
		$str = "<div style='border: 1px solid #000000'>";
		$str .= "<h2>" . get_class($this) . "</h2>";
		foreach($this as $key => $value) {
			if ($key == "id") {
				$str .= "<strong>ID: $value</strong>";
			}

			else {
				$str .= "<p>$key: $value</p>";
			}
		}
		$str .= "</div>";
		return $str;
	}
}

?>


<?php
class DatabaseType {
	protected static $db;

	public static function link_database($db_ref) {
		self::$db = $db_ref;
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

	protected static function find_all_from($db, $column, $callback) {
		$sql = "SELECT * FROM $column";
		$stmt = self::$db->conn()->prepare($sql);
		$status = $stmt->execute();

		$rows_array = [];
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		while ($row !== false) {
			$rows_array[] = $callback($row);
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
		}

		return $rows_array;

	}
}

?>


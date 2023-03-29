<?php

class Drain {
	protected $drain_array;

	public function __construct($arr) {
		if (!is_array($arr)) {
			throw new Exception("Drain got a non array argument");
		}

		$this->drain_array = $arr;
	}

	public function siphon($limit = 1) {
		$result = [];
		$i = 0;
		while ($i < $limit) {
			$result[] = array_shift($this->drain_array);
			$i++;			
		}

		$result = ($limit == 1) ? $result[0] : $result;
		return $result;
	}
}

?>


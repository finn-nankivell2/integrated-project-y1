<?php
require_once "./etc/config.php";

echo "<h1>Testing code goes here</h1>";

try {
	$db = new DB("localhost", "news", "root", "");
	$conn = $db->open();

	echo "Connected to database <br>";
	Author::link_database($db);
	Article::link_database($db);
	Topic::link_database($db);

	foreach(Topic::find_all() as $author) {
		echo $author->properties_as_html();
	}
}

catch(Exception $e) {
	echo $e;
}

finally {
	if ($db != null && $db->is_open()) {
		$db->close();
	}
}
?>


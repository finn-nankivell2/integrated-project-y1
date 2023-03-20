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

	echo "<h1>Authors</h1>";
	foreach(Author::find_all() as $t) {
		echo $t->properties_as_html();
	}

	echo "<h1>Articles</h1>";
	foreach(Article::find_all() as $t) {
		echo $t->properties_as_html();
	}

	echo "<h1>Topics</h1>";
	foreach(Topic::find_all() as $t) {
		echo $t->properties_as_html();
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


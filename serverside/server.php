<?php
function print_formatted_array($arr) {
	foreach ($arr as $prop => $value) {
		echo $prop;
		echo " : ";
		echo $value;
		echo "<br>";
	}
}


function do_GET() {
	echo "<h1>\$_SERVER</h1>";
	print_formatted_array($_SERVER);

	echo "<br><br>";
	echo "<h1>\$_GET</h1>";
	print_formatted_array($_GET);
}

do_GET();
?>


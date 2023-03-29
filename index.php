<!DOCTYPE html>
<html lang="en" dir="ltr">
	<head>
		<meta charset="utf-8">
		<title>webpage</title>

		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&family=Spline+Sans+Mono:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Spline+Sans+Mono:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

		<link rel="stylesheet" href="css/reset.css">
		<link rel="stylesheet" href="css/grid.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/text_styles.css">

		<link rel="stylesheet" href="css/sections/misc.css">
		<link rel="stylesheet" href="css/sections/header.css">
		<link rel="stylesheet" href="css/sections/frontpage.css">
		<link rel="stylesheet" href="css/sections/articles.css">

		<script src="javascript/script.js" defer></script>
	</head>

	<?php
		require_once "./etc/config.php";

		$db = new DB("localhost", "news", "root", "");
		$conn = $db->open();

		Article::link_database($db);
		Author::link_database($db);
		Topic::link_database($db);

		$article_drain = new Drain(Article::find_order_by_date());
		$main_article = $article_drain->siphon(1);
		$main_article_author = Author::find_by_id($main_article->author_id);

		$side_stories = $article_drain->siphon(5);

		$main_stories = $article_drain->siphon(3);
		$main_stories2 = $article_drain->siphon(3);
	?>

	<body>
		<div class="root main-text">
			<div id="header-cover"></div>

			<header class="layout-grid">
				<div class="header-buttons-flex layout-grid-12 header-button-text">
					<h3 class="header-button">front page</h3>
					<h3 class="header-button">today</h3>
					<h3 class="header-button">this week</h3>
					<h3 class="header-button">top articles</h3>
					<h3 class="header-button">reviews</h3>
					<h3 class="header-button">about</h3>
					<div id="dark-theme-button-holder">
						<div id="dark-theme-button">
							<div class="dark-theme-button-shading"></div>
							<div class="dark-theme-button-blocking"></div>
						</div>
					</div>
				</div>
			</header>

			<div id="header-padding"></div>
			<section id="frontpage-section" class="section-margin-bottom">
				<div class="layout-grid">
					<div class="layout-grid-8 frontpage-main-article">
						<?php
						echo "<img src='{$main_article->image}' class='frontpage-main-image'>";
						echo "<div class='frontpage-main-text'>";
							echo "<h4 class='article-topic'>$main_article->sub_heading</h4>";
							echo "<h1 class='frontpage-main-title'>$main_article->title</h1>";
							echo "<h4 class='article-author'>$main_article_author->name</h4>";
							echo "<p class='frontpage-main-summary'>$main_article->summary</p>";
						echo '</div>';
						?>
					</div>

					<div class="layout-grid-4">
						<div class="frontpage-side-flex">
							<?php
							foreach($side_stories as $a) {
								echo 
								'<div class="frontpage-side-article">
									<div class="frontpage-side-article-text">
										<h4 class="article-topic">' . $a->sub_heading . '</h4>
										<h3 class="frontpage-side-article-title">' . $a->title . '</h3>
									</div>
									<img src="' . $a->image . '" alt="">
								</div>';
							}
							?>
						</div>
					</div>
				</div>
			</section>

			<section id="top-week-section" class="section-margin-bottom">
				<div class="section-sep">
					<h3 class="section-sep-title section-sep-text">this week</h3>
					<h3 class="section-sep-text">top articles this week</h3>
				</div>

				<div class="layout-grid articles-group-horizontal">
					<?php
					foreach ($main_stories as $story) {
						echo '<div class="layout-grid-4 article">
							<img src="' . $story->image . '" class="article-image">
							<div class="article-text">
								<h4 class="article-topic">' . $story->sub_heading . '</h4>
								<h1 class="article-title">' . $story->title . '</h1>
								<h4 class="article-author">' . Author::find_by_id($story->author_id)->name. '</h4>
								<p class="article-summary">' . $story->summary . '</p>
							</div>
						</div>';						
					}
					?>
				</div>

				<div class="layout-grid articles-group-horizontal">
					<?php
					foreach ($main_stories2 as $story) {
						echo '<div class="layout-grid-4 article">
							<img src="' . $story->image . '" class="article-image">
							<div class="article-text">
								<h4 class="article-topic">' . $story->sub_heading . '</h4>
								<h1 class="article-title">' . $story->title . '</h1>
								<h4 class="article-author">' . Author::find_by_id($story->author_id)->name. '</h4>
								<p class="article-summary">' . $story->summary . '</p>
							</div>
						</div>';						
					}
					?>
				</div>

				<!-- <div class="layout-grid articles-group-horizontal">
					<div class="layout-grid-4 article">
						<img src="images/placeholder/fractal10.jpg" class="article-image">
						<div class="article-text">
							<h4 class="article-topic">environment</h4>
							<h1 class="article-title">The Mining Industry's Next Frontier Is Deep, Deep Under the Sea</h1>
							<h4 class="article-author">arthur article</h4>
							<p class="article-summary">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex eos voluptatum ducimus modi culpa, nesciunt atque ullam adipisci nam! Ullam consequatur odit nam voluptas veniam qui culpa omnis ipsa illo.</p>
						</div>
					</div>

					<div class="layout-grid-4 article">
						<img src="images/placeholder/fractal9.jpg" class="article-image">
						<div class="article-text">
							<h4 class="article-topic">economy</h4>
							<h1 class="article-title">Heat Pumps Sell Like Hotcakes on America's Oil-Rich Frontier</h1>
							<h4 class="article-author">william write</h4>
							<p class="article-summary">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex eos voluptatum ducimus modi culpa, nesciunt atque ullam adipisci nam! Ullam consequatur odit nam voluptas veniam qui culpa omnis ipsa illo.</p>
						</div>
					</div>

					<div class="layout-grid-4 article">
						<img src="images/placeholder/fractal8.jpg" class="article-image">
						<div class="article-text">
							<h4 class="article-topic">tech review</h4>
							<h1 class="article-title">The Best Apple 3-in-1 Wireless Chargers</h1>
							<h4 class="article-author">peter o'hanrahahanrahan</h4>
							<p class="article-summary">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex eos voluptatum ducimus modi culpa, nesciunt atque ullam adipisci nam! Ullam consequatur odit nam voluptas veniam qui culpa omnis ipsa illo.</p>
						</div>
					</div>
				</div> -->
			</section>
		</div>
	</body>
</html>


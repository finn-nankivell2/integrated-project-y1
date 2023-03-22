#!/usr/bin/python3
from get_headlines import HeadlineScrape
import random


def random_topic():
	TOPICS = [
		"CURRENT EVENTS",
		"POLITICS",
		"TECHNOLOGY",
		"ENVIRONMENT",
		"DOMESTIC",
		"CULTURE"
	]
	return random.choice(TOPICS)


def lorem(length=None):
	LOREM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	return LOREM if length is None else LOREM[:length]


def insert_headline_sql(headlines_list):
	sql = "INSERT INTO `articles` (`author_id`, `title`, `sub_heading`, `short_headline`, `content`, `image`, `date`, `time`, `location`, `summary`) VALUES"

	for headline in headlines_list:
		headline = headline.replace("'", "")
		sql += f"(1, '{headline}', '{random_topic()}', 'Test', '{lorem()}', 'images/placeholder/fractal6.jpg', '0000-00-00', '00:00:00', 'dublin', '{lorem(255)}'),\n"

	sql = sql[:-2]
	sql += ";"
	return sql


SQL_FILE_PATH = "../database/news.sql"
SQL_OUTPUT_PATH = "../database/news_append.sql"

HEADLINE_LENGTH = 55


def main():
	news_sites = [
		# HeadlineScrape("https://theguardian.com", "js-headline-text"),
		HeadlineScrape("https://kotaku.com", "sc-1qoge05-0"),
		HeadlineScrape("https://wired.com", "SummaryItemHedBase-eaxFWE"),
		HeadlineScrape("https://gameinformer.com", "page-link"),
	]

	headlines = []
	for site in news_sites:
		headlines.extend([h for h in site.get_all_headlines() if len(h) < HEADLINE_LENGTH])

	sql_new_FILE = open(SQL_OUTPUT_PATH, "w+")

	sql_to_execute = insert_headline_sql(headlines)
	sql_to_execute = "DELETE FROM articles;\n" + sql_to_execute

	sql_new_FILE.write(sql_to_execute)
	sql_new_FILE.close()

	print("\n".join(headlines))


if __name__ == "__main__":
	main()


#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup


class HeadlineScrape():
	def __init__(self, req, classname):
		self._req = req
		self._classname = classname

	def _activate_request(self):
		self.response = requests.get(self._req)
		self.soup = BeautifulSoup(self.response.text, "html.parser")

	def get_all_headlines(self):
		self._activate_request()
		headlines = self.soup.find_all(class_=self._classname)

		headlines_real = []
		for h in headlines:
			txt = h.string
			if txt not in headlines_real and txt:
				headlines_real.append(txt)

		return headlines_real


def main():
	guardian = HeadlineScrape("https://theguardian.com", "js-headline-text")
	kotaku = HeadlineScrape("https://kotaku.com", "sc-1qoge05-0")
	wired = HeadlineScrape("https://wired.com", "SummaryItemHedBase-eaxFWE")

	headlines = wired.get_all_headlines()
	[print(f) for f in headlines]


if __name__ == "__main__":
	main()


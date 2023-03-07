let darkTheme = false;
let wasPulled = false;
const INVERT_STRENGTH = 20;


function invertCssColours() {
	darkTheme = !darkTheme;

	function parseColor(input) {
		let m = input.match(/^rgb\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)$/i);
		if(m) {
			return [parseInt(m[1]), parseInt(m[2]), parseInt(m[3])];
		}
		return input;
	}

	function pullColour(rgb, anchor, strength) {
		const normalize = (n) => (n > 0) ? 1 : (n < 0) ? -1 : 0;

		let pullRgb = [
			rgb[0]+normalize(anchor-rgb[0])*strength,
			rgb[1]+normalize(anchor-rgb[1])*strength,
			rgb[2]+normalize(anchor-rgb[2])*strength,
		];

		return pullRgb;
	}

	function invertRgb(rgb) {
		let initialC = parseColor(rgb);

		if (darkTheme && !wasPulled) {
			initialC = pullColour(initialC, 127, INVERT_STRENGTH);
		}

		let invertedC = [
			255-initialC[0],
			255-initialC[1],
			255-initialC[2],
		];

		return `rgb(${invertedC[0]}, ${invertedC[1]}, ${invertedC[2]})`;
	}

	console.log(document);
	for (let sheet of document.styleSheets) {
		try {
			for (let rule of sheet.cssRules) {
				rule.style.transition = "all 200ms ease-in-out";

				if (rule.style.color) {
					rule.style.color = invertRgb(rule.style.color);
				}

				if (rule.style.backgroundColor) {
					rule.style.backgroundColor = invertRgb(rule.style.backgroundColor);
				}

				if (rule.style.borderColor) {
					rule.style.borderColor = invertRgb(rule.style.borderColor);

				}
			}
		}

		catch(e) {
			console.log(e);
		}
	}

	if (darkTheme) {
		wasPulled = true;
	}
}


(function() {
	const button = document.getElementById("dark-theme-button");

	document.getElementById("dark-theme-hover").addEventListener("mouseenter", function(e) {
		e.preventDefault();
		button.style.transform = "translate(0px, 0px)";
	});

	button.addEventListener("mouseenter", function(e) {
		e.preventDefault();
		button.style.transform = "translate(0px, 0px)";
	});

	button.addEventListener("click", function(e) {
		e.preventDefault();
		invertCssColours();
	});

	document.getElementById("dark-theme-hover").addEventListener("mouseleave", function(e) {
		e.preventDefault();
		button.style.transform = "translate(150px, 0px)";
	});


})();


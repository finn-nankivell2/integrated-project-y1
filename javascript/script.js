// Functions for interracting with RGB colour
const colorTools = {
	PULL_STRENGTH: 20,

	// Function to parse a colour from css
	parseColor: function(input) {
		let m = input.match(/^rgb\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)$/i);
		if(m) {
			return [parseInt(m[1]), parseInt(m[2]), parseInt(m[3])];
		}
		return input;
	},

	// Move all three rgb channels closer to the anchor, by the strength
	pullColor: function(rgb, anchor, strength) {
		const normalize = (n) => (n > 0) ? 1 : (n < 0) ? -1 : 0;

		let pullRgb = [
			rgb[0]+normalize(anchor-rgb[0])*strength,
			rgb[1]+normalize(anchor-rgb[1])*strength,
			rgb[2]+normalize(anchor-rgb[2])*strength,
		];

		return pullRgb;
	},

	// Check if an rgb colour can be considered greyscale
	isGreyscale: function(rgb, greyscaleRange) {
		return (Math.abs(rgb[0]-rgb[1]) <= greyscaleRange && Math.abs(rgb[1]-rgb[2]) <= greyscaleRange);
	},

	// Invert and pull and rgb colour
	invertRgb: function(rgb) {
		let initialC = this.parseColor(rgb);
		if (!this.isGreyscale(initialC, 10)) {
			return rgb;
		}

		initialC = this.pullColor(initialC, 127, this.PULL_STRENGTH);
		let invertedC = [
			255-initialC[0],
			255-initialC[1],
			255-initialC[2]
		];
		console.log(invertedC);

		return `rgb(${invertedC[0]}, ${invertedC[1]}, ${invertedC[2]})`;
	}
};


// Object for managing the two themes
const darkAndLightTheme = {
	defaultThemeRules: [],
	darkThemeRules: [],

	darkThemeActive: false,
	currentlyTransitioning: false,

	// Setup the themes when the script starts
	setup: function(cssSheets) {
		this.cssSheetsDynamic = cssSheets;

		for (let sheet of cssSheets) {
			try {
				if (!sheet.rules) {
					continue;
				}
			}

			catch(e) {
				console.log(e);
				continue;
			}

			// Create different themes based on the cssRules
			for (let rule of sheet.cssRules) {
				if (!rule.style) continue;

				let defaultRules = [];
				let overrideRules = [];

				if (rule.style.color) {
					overrideRules.push(["color", colorTools.invertRgb(rule.style.color)]);
					defaultRules.push(["color", rule.style.color]);

				}

				if (rule.style.backgroundColor) {
					overrideRules.push(["backgroundColor", colorTools.invertRgb(rule.style.backgroundColor)]);
					defaultRules.push(["backgroundColor", rule.style.backgroundColor]);

				}

				if (rule.style.borderColor) {
					overrideRules.push(["borderColor", colorTools.invertRgb(rule.style.borderColor)]);
					defaultRules.push(["borderColor", rule.style.borderColor]);

				}

				if (overrideRules.length > 0) {
					this.defaultThemeRules.push(this.createRuleOverride(rule, defaultRules));
					this.darkThemeRules.push(this.createRuleOverride(rule, overrideRules));
				}
			}
		}
	},

	// Apply all rules for a given theme
	applyRules: function(theme) {
		this.currentlyTransitioning = true;
		for (let override of theme) {
			override.activate();
		}

		let t = this;
		setTimeout(function() {
			t.currentlyTransitioning = false;
		}, 201);
	},

	// Create an object that contains alternate css rules and updates the live ones
	createRuleOverride: function(rule, properties) {
		return {
			rule: rule, // Reference to the cssRule object
			properties: properties, // List of css properties to update

			// Activate apply the changes to the csRule properties
			activate: function() {
				let rule = this.rule;

				// For a smooth transition
				let transitionStyle = rule.style.transition;
				rule.style.transition = "all 200ms ease-in-out";

				// Update all properties
				for (let pair of this.properties) {
					try {
						switch (pair[0]) {
							case "color": rule.style.color = pair[1]; break;
							case "borderColor": rule.style.borderColor = pair[1]; break;
							case "backgroundColor": rule.style.backgroundColor = pair[1]; break;
							default: throw `Invalid property: ${pair[0]}`;
						}
					}

					// Catch any potential errors such as the css file being readonly
					catch(e) {
						console.log(e);
					}
				}
				// Reset
				setTimeout(function() {
					rule.style.transition = transitionStyle;
				}, 200);
			}
		}
	}
};


(function() {
	darkAndLightTheme.setup(document.styleSheets);

	const button = document.getElementById("dark-theme-button-holder");
	button.addEventListener("click", function(e) {
		e.preventDefault();

		// If currently switching between themes, do not switch again
		if (darkAndLightTheme.currentlyTransitioning) {
			return;
		}

		darkAndLightTheme.darkThemeActive = !darkAndLightTheme.darkThemeActive;
		if (darkAndLightTheme.darkThemeActive) {
			darkAndLightTheme.applyRules(darkAndLightTheme.darkThemeRules);
		}

		else {
			darkAndLightTheme.applyRules(darkAndLightTheme.defaultThemeRules);
		}

	});
})();


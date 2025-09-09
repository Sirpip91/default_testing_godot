extends Node

# Current player alignment: "Light" or "Dark"
var current: String = "Light"

# Optional: track history or points for endings
var light_points: int = 0
var dark_points: int = 0

# Switch alignment
func set_light():
	current = "Light"

func set_dark():
	current = "Dark"

func add_point():
	if current == "Light":
		light_points += 1
	else:
		dark_points += 1
	
"""Now, any script in the project can check the player’s alignment via
if Alignment.current == "Light":
	# Do Light behavior
else:
	# Do Dark behavior
"""

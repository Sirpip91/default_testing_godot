extends Node

signal alignment_changed(new_alignment)

var current: String = "Light"
var light_points: int = 0
var dark_points: int = 0

func set_light():
	if current != "Light":
		current = "Light"
		emit_signal("alignment_changed", current)

func set_dark():
	if current != "Dark":
		current = "Dark"
		emit_signal("alignment_changed", current)

func add_point():
	if current == "Light":
		light_points += 1
	else:
		dark_points += 1

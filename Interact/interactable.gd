extends CollisionObject3D
class_name Interactable

@export var light_message = "Light Path"
@export var dark_message = "Dark Path"

func light_action(body):
	print(body.name, " chose LIGHT on ", name)
	# Example: spawn key, reveal clue, unlock door

func dark_action(body):
	print(body.name, " chose DARK on ", name)
	# Example: smash door, shortcut, trigger shadow

extends DirectionalLight3D

# Speed of rotation in degrees per second
@export var rotation_speed_deg := 10.0

func _process(delta: float) -> void:
	# Convert degrees per second to radians per second
	var rotation_speed_rad = deg_to_rad(rotation_speed_deg)
	
	# Rotate around Y axis
	rotation.y += rotation_speed_rad * delta

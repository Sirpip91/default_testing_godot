extends DirectionalLight3D

var rotation_speed: float = 45.0 # degrees per second

func _process(delta: float) -> void:
	# Increase the Y rotation
	rotation_degrees.y += rotation_speed * delta
	
	# Reset if it goes over 360
	if rotation_degrees.y >= 360.0:
		rotation_degrees.y = 0.0

extends RayCast3D
@onready var InteractText = $Label

# Set colors
var default_color = Color.WHITE
var dark_color = Color(0.6, 0, 0.8)   # purple
var light_color = Color(1, 1, 0)      # yellow

func _physics_process(_delta):
	if is_colliding():
		var target = get_collider()
		if target is Interactable:
			# --- Show current alignment option ---
			if Alignment.current == "Light":
				InteractText.text = "Light Option: " + target.light_message
				InteractText.modulate = light_color
			else: # Dark
				InteractText.text = "Dark Option: " + target.dark_message
				InteractText.modulate = dark_color
			
			# --- Commit Choice ---
			if Input.is_action_just_pressed("commit_choice"):
				if Alignment.current == "Light":
					target.light_action(owner)
					Alignment.add_point()
					owner.committed_choice = "Light"
				else:
					target.dark_action(owner)
					Alignment.add_point()
					owner.committed_choice = "Dark"
				
				# Reset text after commit
				InteractText.text = ""
				InteractText.modulate = default_color
		else:
			# Colliding but not interactable
			InteractText.text = ""
			InteractText.modulate = default_color
	else:
		# Raycast not colliding
		InteractText.text = ""
		InteractText.modulate = default_color

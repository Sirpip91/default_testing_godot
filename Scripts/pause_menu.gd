extends ColorRect
@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var resume_button: Button = find_child("Resume")
@onready var quit_button: Button =find_child("Quit")
@onready var fps_counter_check: CheckBox =find_child("FpsCounter")

# Called when the node enters the scene tree for the first time. (basicaaly the main)

func _ready() -> void:
	#resume the game
	resume_button.pressed.connect(_unpause)
	#close the game
	quit_button.pressed.connect(get_tree().quit)

func _unpause():
	animator.play("Unpause");
	get_tree().paused = false
	#Make the mouse hidden(CAPTURED) when unpaused
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	
func _pause():
	animator.play("Pause");
	get_tree().paused = true
	#Make the mouse visable 
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);

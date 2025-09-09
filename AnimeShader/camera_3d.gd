extends Camera3D

var speed := 5.0
var mouse_sensitivity := 0.002
var rotation_x := 0.0
var rotation_y := 0.0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_y -= event.relative.x * mouse_sensitivity
		rotation_x -= event.relative.y * mouse_sensitivity
		rotation_x = clamp(rotation_x, -1.5, 1.5) # Limit up/down looking

		rotation = Vector3(rotation_x, rotation_y, 0)

	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(delta: float) -> void:
	var direction := Vector3.ZERO

	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	if Input.is_action_pressed("move_up"):
		direction += transform.basis.y
	if Input.is_action_pressed("move_down"):
		direction -= transform.basis.y

	if direction != Vector3.ZERO:
		direction = direction.normalized()

	translate(direction * speed * delta)

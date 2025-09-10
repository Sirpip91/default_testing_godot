extends Node3D
class_name AlignmentMesh

@export var light_material: Material
@export var dark_material: Material

@onready var mesh_instance: MeshInstance3D = $"."

func _ready():
	# Connect using Callable
	Alignment.connect("alignment_changed", Callable(self, "_on_alignment_changed"))
	_apply_material()

func _exit_tree():
	if Alignment.is_connected("alignment_changed", Callable(self, "_on_alignment_changed")):
		Alignment.disconnect("alignment_changed", Callable(self, "_on_alignment_changed"))

@warning_ignore("unused_parameter")
func _on_alignment_changed(new_alignment: String):
	_apply_material()

func _apply_material():
	if Alignment.current == "Light":
		if light_material:
			mesh_instance.material_override = light_material
	else:
		if dark_material:
			mesh_instance.material_override = dark_material

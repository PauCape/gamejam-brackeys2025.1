extends Area2D

@export_enum("berries", "egg", "flower") var ingredient: String

var mouseInArea = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") && mouseInArea:
		var scenePath = "res://Scenes/Ingredients/ingredient_" + ingredient + ".tscn"
		var scene = load(scenePath)
		var instance = scene.instantiate()
		instance.position = get_global_mouse_position()
		get_parent().add_child(instance)

func _on_mouse_entered() -> void:
	mouseInArea = true

func _on_mouse_exited() -> void:
	mouseInArea = false

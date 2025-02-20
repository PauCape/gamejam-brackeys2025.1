extends Area2D

@export_enum("berries", "egg", "flower", "butterfly", "garlic", "herb", "honeycomb", "mushroom") var ingredient: String

var mouseInArea = false

func _ready() -> void:
	var texturePath = "res://Art/Sprites/Ingredients/" + ingredient + ".png"
	var texture = load(texturePath)
	self.get_node("Sprite2D").texture = texture

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") && mouseInArea:
		var spriteNode = get_node("Sprite2D")
		var texture = spriteNode.texture
		var scenePath = "res://Scenes/Ingredients/ingredient_dragged.tscn"
		var scene = load(scenePath)
		var instance = scene.instantiate()
		instance.position = get_global_mouse_position()
		instance.name = ingredient.capitalize()
		instance.get_node("Sprite2D").texture = texture
		get_parent().add_child(instance)

func _on_mouse_entered() -> void:
	mouseInArea = true

func _on_mouse_exited() -> void:
	mouseInArea = false

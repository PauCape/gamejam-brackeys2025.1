extends RigidBody2D

var mouseInIngredient = false
var dragging = false
var released = false

signal ingredientInPot

func _ready():
	gravity_scale = 0

func _input(event):
	if event is InputEventMouseButton:
		
		if event.is_pressed() && mouseInIngredient && !released:
			
			dragging = true
			gravity_scale = 0
			linear_velocity = Vector2.ZERO
			set_freeze_mode(RigidBody2D.FREEZE_MODE_KINEMATIC)
			
			
		if event.is_released() && dragging:
			
			dragging = false
			released = true
			mouseInIngredient = false
			gravity_scale = 1
			position = global_position

func _process(delta) -> void:
	if dragging && !released:
		position = get_global_mouse_position()

func _on_mouse_entered() -> void:
	mouseInIngredient = true

func _on_mouse_exited() -> void:
	mouseInIngredient = false

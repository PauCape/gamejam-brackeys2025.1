extends RigidBody2D

var mouseInIngredient = false
var dragging = false

func _ready():
	gravity_scale = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouseInIngredient:
			dragging = true
			linear_velocity = Vector2.ZERO
			gravity_scale = 0
			set_freeze_mode(RigidBody2D.FREEZE_MODE_KINEMATIC)
		if event.is_released() && dragging:
			dragging = false
			position = global_position
			gravity_scale = 1
			mouseInIngredient = false

func _physics_process(delta):
	print(mouseInIngredient)
	if dragging:
		position = get_global_mouse_position()

func _on_mouse_entered() -> void:
	mouseInIngredient = true

func _on_mouse_exited() -> void:
	mouseInIngredient = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()

extends RigidBody2D

var dragging = true

func _ready() -> void:
	gravity_scale = 0
	linear_velocity = Vector2.ZERO
	freeze = true

func _physics_process(delta) -> void:
	
	if position.y > 180:
		self.queue_free()
		
	if dragging:
		self.position = get_global_mouse_position()
		
	if Input.is_action_just_released("left_click"):
		dragging = false
		gravity_scale = 1
		freeze = false

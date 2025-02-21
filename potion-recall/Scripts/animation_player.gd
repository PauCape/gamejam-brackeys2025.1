extends AnimationPlayer

func _ready():
	play("Idle")

func _on_area_2d_ingredient_in_pot(body: Variant) -> void:
	stop()
	play("Drop_Animation")
	await animation_finished
	play("Idle")

extends Area2D

signal ingredientInPot(body)

func _on_body_entered(body: Node2D) -> void:
	ingredientInPot.emit(body)
	body.queue_free()

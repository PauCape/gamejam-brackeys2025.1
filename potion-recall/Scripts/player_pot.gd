extends Node2D

signal ingredientInPot(body)

func _on_area_2d_ingredient_in_pot(body: Variant) -> void:
	ingredientInPot.emit(body)

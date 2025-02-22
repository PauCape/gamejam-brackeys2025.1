extends Node2D

@onready var bad_ingredient_sound: AudioStreamPlayer2D = $BadIngredientSound
@onready var right_ingredient_sound: AudioStreamPlayer2D = $RightIngredientSound

var isBadIngredient: bool = false
signal ingredientInPot(body)

func _on_area_2d_ingredient_in_pot(body: Variant) -> void:
	right_ingredient_sound.play()
	ingredientInPot.emit(body)

func _on_random_list_bad_ingredient() -> void:
	bad_ingredient_sound.play()

extends Control

signal completedList
signal badIngredient

@onready var itemList: ItemList = $ItemList
@onready var player_pot: Node2D = $"../PlayerPot"
@onready var bad_ingredient_sound: AudioStreamPlayer2D = $BadIngredientSound
@onready var right_ingredient_sound: AudioStreamPlayer2D = $RightIngredientSound

@export var levelNumber = 1
@export var difficulty = 2

var levelDifficulty = 0
var levelCompleted = false
var globalIndex = 0
var listHidded = false

var items: Array = ["Berries", "Butterfly", "Egg", "Flower", "Garlic", "Herb", "Honeycomb", "Mushroom"]

func _on_player_pot_ingredient_in_pot(body: Variant) -> void:
	if listHidded:
		var redColor = Color(1, 0, 0, 1)
		var greenColor = Color(0, 1, 0, 1)
		
		if itemList.get_item_text(globalIndex) == body.name:
			right_ingredient_sound.play()
			itemList.set_item_custom_fg_color(globalIndex, greenColor)
			
			if globalIndex == itemList.get_item_count() - 1:
				completedList.emit()
				return
				
			globalIndex = globalIndex + 1
		else:
			itemList.set_item_custom_fg_color(globalIndex, redColor)
			bad_ingredient_sound.play()
			badIngredient.emit()


func _on_main_reload_list(levelNumber: Variant) -> void:
	
	levelDifficulty = difficulty * levelNumber
	globalIndex = 0
	
	itemList.clear()
	for index in range(levelDifficulty):
		var indexRandom = randi() % items.size()
		itemList.add_item(items[indexRandom])

func _on_main_hide_list() -> void:
	listHidded = true
	var hideColor = Color(1, 1, 1, 0)
	for index in levelDifficulty:
		itemList.set_item_custom_fg_color(index, hideColor)

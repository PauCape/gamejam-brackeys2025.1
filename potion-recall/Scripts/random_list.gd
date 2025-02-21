extends Control

signal completedList
signal badIngredient

#@onready var levelNumberLabel: RichTextLabel = $LevelNumberLabel
@onready var itemList: ItemList = $ItemList

@export var levelNumber = 1
@export var difficulty = 2

var levelDifficulty = levelNumber * difficulty
var levelCompleted = false
var globalIndex = 0

var items: Array = ["Berries", "Butterfly", "Egg", "Flower", "Garlic", "Herb", "Honeycomb", "Mushroom"]

func _on_drop_area_ingredient_in_pot(body: Node2D) -> void:
	var redColor = Color(1, 0, 0, 1)
	var greenColor = Color(0, 1, 0, 1)
	
	if itemList.get_item_text(globalIndex) == body.name:
		itemList.set_item_custom_fg_color(globalIndex, greenColor)
		globalIndex = globalIndex + 1
		
		#Condicion de ganar
		
		#Enviar aviso al main de que ha completado la lista
		
	else:
		itemList.set_item_custom_fg_color(globalIndex, redColor)
		
		#Enviar aviso al main de que ha perdido

func _on_main_reload_list(levelNumber: Variant) -> void:
	for index in range(difficulty * levelNumber):
		var indexRandom = randi() % items.size()
		itemList.add_item(items[indexRandom])

func _on_main_hide_list() -> void:
	var hideColor = Color(1, 1, 1, 0)
	for index in levelDifficulty:
		itemList.set_item_custom_fg_color(index, hideColor)

extends Control

@onready var berries: RigidBody2D = $"../Berries"
@onready var butterfly: RigidBody2D = $"../Butterfly"
@onready var egg: RigidBody2D = $"../Egg"
@onready var flower: RigidBody2D = $"../Flower"
@onready var garlic: RigidBody2D = $"../Garlic"
@onready var herb: RigidBody2D = $"../Herb"
@onready var honeycomb: RigidBody2D = $"../Honeycomb"
@onready var mushroom: RigidBody2D = $"../Mushroom"

@onready var level_number_label: RichTextLabel = $LevelNumberLabel

@export var levelNumber = 1
@export var difficulty = 2
var levelDifficulty = levelNumber * difficulty # == numero de items activos en lista

var items: Array
var isLevelCompleted: bool

var itemIndex = 0
var isFirstItem: bool = false

signal winningTime

func _ready() -> void:
	#ALERT: estaría bien  en otra funcion para que no se inicialice el array en _ready
	var items = [berries, butterfly, egg, flower, garlic, herb, honeycomb, mushroom]
	add_item_in_list(items)

func add_item_in_list(items):
	for i in pick_n_random_values(items, levelDifficulty):
		$ItemList.add_item(i.name)

func pick_n_random_values(array: Array, n: int) -> Array:
	var array_copy: Array = array.duplicate()
	array_copy.shuffle()
	return array_copy.slice(0, n)
	
func increment_level_label(completed) -> void:
	if completed:
		level_number_label.clear()
		add_item_in_list(items)
		levelNumber += 1
		level_number_label.add_text(str(levelNumber))
		_ready()

# funcion que quitará el nombre del ingrediente metido en el POT
func change_item_name(itemName: String) -> void:
	if isFirstItem:
		for i in range(0, levelDifficulty):
			if $ItemList.get_item_text(i) == itemName:
				$ItemList.set_item_disabled(i, true)
				#$ItemList.set_item_text(i, " ")
			else:
				pass

# funcion que checkea si se ha resulto toda la lista
func check_item_list_status() -> bool:
	var count = 0 # == posicion
	isLevelCompleted = false
	for i in range(0, levelDifficulty):
		if $ItemList.get_item_text(i) == " ": # se podra añadir que el timer siga activo
			count += 1
			### si entra, nivel completado
			if count == levelDifficulty:
				isLevelCompleted = true
			else:
				pass
		else: # se podra añadir si el timer acaba antes de resolver
			pass
	return isLevelCompleted
	
# funcion que comprueba si el item añadido es el primero de la lista
#ALERT al completar el nivel se tiene que resetear la posicion
func check_item_order(targetIngredient) -> bool:
	var firstItemInList = $ItemList.get_item_text(itemIndex)

	if targetIngredient == firstItemInList:
		isFirstItem = true
		itemIndex += 1
		print("first item")
	return isFirstItem

#NOTE funcion que engloba las funciones que usa cada ingrediente
func ingredient_functions(ingredientname: String) -> void:
	check_item_order(ingredientname)
	change_item_name(ingredientname)
	check_item_list_status()
	increment_level_label(isLevelCompleted)

#NOTE señales que emiten los ingredientes cuando entran el POT
func _on_berries_ingredient_in_pot(body: Node2D) -> void:
	ingredient_functions("Berries")

func _on_butterfly_ingredient_in_pot() -> void:
	ingredient_functions("Butterfly")

func _on_egg_ingredient_in_pot() -> void:
	ingredient_functions("Egg")

func _on_flower_ingredient_in_pot() -> void:
	ingredient_functions("Flower")

func _on_garlic_ingredient_in_pot() -> void:
	ingredient_functions("Garlic")

func _on_herb_ingredient_in_pot() -> void:
	ingredient_functions("Herb")

func _on_honeycomb_ingredient_in_pot() -> void:
	ingredient_functions("Honeycomb")

func _on_mushroom_ingredient_in_pot() -> void:
	ingredient_functions("Mushroom")

extends Control

@onready var berries: RigidBody2D = $"../Berries"
@onready var butterfly: RigidBody2D = $"../Butterfly"
@onready var egg: RigidBody2D = $"../Egg"
@onready var flower: RigidBody2D = $"../Flower"
@onready var garlic: RigidBody2D = $"../Garlic"
@onready var herb: RigidBody2D = $"../Herb"
@onready var honeycomb: RigidBody2D = $"../Honeycomb"
@onready var mushroom: RigidBody2D = $"../Mushroom"

@export var levelNumber = 1
@export var difficulty = 2
var levelDifficulty = levelNumber * difficulty # == numero de items activos en lista

signal winningTime

func _ready() -> void:
	#ALERT: estaría bien var global para que no se inicialice el array en _ready
	var items = [berries, butterfly, egg, flower, garlic, herb, honeycomb, mushroom]
	for i in pick_n_random_values(items, levelDifficulty):
		$ItemList.add_item(i.name)

func _process(delta: float) -> void:
	check_item_list_status()

func pick_n_random_values(array: Array, n: int) -> Array:
	var array_copy: Array = array.duplicate()
	array_copy.shuffle()
	return array_copy.slice(0, n)

func _on_button_pressed() -> void:
	$ItemList.clear()
	$LevelNumber.clear()
	levelNumber = 1
	$LevelNumber.add_text(str(levelNumber))
	_ready()
		

func _on_increment_level_button_pressed() -> void:
	$LevelNumber.clear()
	_ready()
	levelNumber += 1
	$LevelNumber.add_text(str(levelNumber))

# funcion que quitará el nombre del ingrediente metido en el POT
func change_item_name(itemName: String) -> void:
	for i in range(0, levelDifficulty):
		if $ItemList.get_item_text(i) == itemName:
			$ItemList.set_item_text(i, " ")
		else:
			pass

# funcion que checkea si se ha resulto toda la lista
func check_item_list_status() -> void:
	var count = 0
	for i in range(0, levelDifficulty):
		if $ItemList.get_item_text(i) == " ": # se podra añadir que el timer siga activo
			count += 1
			if count == levelDifficulty:
				print("You Win!")
				emit_signal("winningTime")
		else: # se podra añadir si el timer acaba antes de resolver
			pass

#NOTE señales que emiten los ingredientes cuando entran el POT
func _on_berries_ingredient_in_pot() -> void:
	change_item_name("Berries")

func _on_butterfly_ingredient_in_pot() -> void:
	change_item_name("Butterfly")

func _on_egg_ingredient_in_pot() -> void:
	change_item_name("Egg")

func _on_flower_ingredient_in_pot() -> void:
	change_item_name("Flower")

func _on_garlic_ingredient_in_pot() -> void:
	change_item_name("Garlic")

func _on_herb_ingredient_in_pot() -> void:
	change_item_name("Herb")

func _on_honeycomb_ingredient_in_pot() -> void:
	change_item_name("Honeycomb")

func _on_mushroom_ingredient_in_pot() -> void:
	change_item_name("Mushroom")

extends Control

var items = ["apple", "watermelon", "potato", "tomato", "cucumber", "carrot", "pear", "pinapple"]
var levelNumber = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in pick_n_random_values(items, levelNumber*2):
		$ItemList.add_item(i)

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

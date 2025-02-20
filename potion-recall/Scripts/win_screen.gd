extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func winning_time():
	show()

func _on_random_list_winning_time() -> void:
	winning_time()

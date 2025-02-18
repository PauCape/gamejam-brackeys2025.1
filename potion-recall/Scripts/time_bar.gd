extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()

func set_value(value):
	$TextureProgressBar.value = value
	if value <= 100:
		show()
	else:
		hide()

extends Control

@onready var win_sound: AudioStreamPlayer2D = $WinSound

func _ready() -> void:
	hide()
	
func _on_main_win() -> void:
	await get_tree().create_timer(0.1).timeout
	win_sound.play()
	show()
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

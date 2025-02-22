extends Node2D

@onready var music_menu: AudioStreamPlayer2D = $MusicMenu
@onready var start_sound: AudioStreamPlayer2D = $StartSound

var button_type = null

func _ready() -> void:
	music_menu.play()

func _on_start_button_pressed() -> void:
	music_menu.stop()
	start_sound.play()
	await get_tree().create_timer(0.46).timeout
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	button_type = "start"

func _on_exit_button_pressed() -> void:
	get_tree().quit()

#func _on_fade_timer_timeout() -> void:
	#if button_type == "start":
		#get_tree().change_scene_to_file("res://Scenes/main.tscn")
	

extends Control

@onready var wrong_sound: AudioStreamPlayer2D = $WrongSound

func _ready() -> void:
	self.hide()

func time_out_screen():
	await get_tree().create_timer(0.1).timeout
	wrong_sound.play()
	self.show()
	$AnimationPlayer.play("show")
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

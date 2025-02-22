extends Control

@onready var win_sound: AudioStreamPlayer2D = $WinSound
@onready var nothing_wrong_sound: AudioStreamPlayer2D = $NothingWrongSound

func _ready() -> void:
	hide()
	
func _on_main_win() -> void:
	win_sound.play()
	nothing_wrong_sound.play()
	show()

extends Control

@onready var wrong_sound: AudioStreamPlayer2D = $WrongSound

func _ready() -> void:
	self.hide()

func time_out_screen():
	wrong_sound.play()
	self.show()
	$AnimationPlayer.play("show")

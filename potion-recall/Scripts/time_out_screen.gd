extends Control

@export var visible_ui : Control


func _ready() -> void:
	self.hide()

func time_out_screen():
	self.show()
	$AnimationPlayer.play("show")

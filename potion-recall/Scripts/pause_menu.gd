extends Node2D

func _ready() -> void:
	hide()

func resume():
	hide()
	get_tree().paused = false

func pause():
	show()
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	
func esc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

func _on_resume_button_pressed() -> void:
	resume()

func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _process(delta: float) -> void:
	esc()

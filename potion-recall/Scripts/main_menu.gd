extends Node2D

var button_type = null

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	button_type = "start"
	$FadeTransition.show()
	$FadeTransition/FadeTimer.start()
	$FadeTransition/AnimationPlayer.play("Fade_In")

func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	

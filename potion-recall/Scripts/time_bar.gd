extends Control

@onready var textureProgressBar: TextureProgressBar = $TextureProgressBar
@onready var timer: Timer = $Timer

var segundos = 0

signal halfTime
signal clockStopped

func _on_main_start_clock() -> void:
	textureProgressBar.value = 100
	timer.start()
	
func _on_timer_timeout() -> void:
	segundos = segundos + 1
	textureProgressBar.value = textureProgressBar.value - 10
	if segundos > 5:
		halfTime.emit()
	
	if segundos == 10:
		timer.stop()
		clockStopped.emit()

func _on_main_reset_clock() -> void:
	textureProgressBar.value = 100
	segundos = 0
	timer.stop()

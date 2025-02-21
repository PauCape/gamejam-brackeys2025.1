extends Control

@onready var textureProgressBar: TextureProgressBar = $TextureProgressBar
@onready var timer: Timer = $Timer

var segundos = 0

signal clockStopped

func _on_main_start_clock() -> void:
	textureProgressBar.value = 100
	timer.start()
	
func _on_timer_timeout() -> void:
	segundos = segundos + 1
	textureProgressBar.value = textureProgressBar.value - 25
	if segundos == 4:
		timer.stop()
		clockStopped.emit()

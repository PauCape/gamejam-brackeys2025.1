extends Node

var totalTime = 4.0
var sec = totalTime
var currentTime = sec
var minute = 0.0

signal clockStopped

func _ready() -> void:
	$Clock/TimeStatus.text = str(minute) + "0" + ":" + str(totalTime)
	$Clock.set_value(100)
	$Timer.start()
	get_tree().paused = true

func game_time():
	if sec > 0:
		sec -= 1
		countdown()
		$Clock/TimeStatus.text = str(minute) + "0" + ":" + str(sec)
	else:	
		clockStopped.emit()

func countdown():
	currentTime -= 1
	var time_bar_progress = (currentTime/totalTime) * 100
	# llama  la funcion de clock para modificar el reloj
	$Clock.set_value(time_bar_progress) 

func _on_timer_timeout() -> void:
	game_time()

func _on_main_start_clock() -> void:
	get_tree().paused = false

extends Node

var totalTime = 10.0
var sec = totalTime
var currentTime = sec
var minute = 0.0

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
		$TimeOutScreen.time_out_screen()
	#else:
		#sec = startTime - 1
		#if minute > 0:
			#minute -= 1
			#$timeStatus.text = str(minute) + ":" + str(sec)
		#else:
			#$Timer.stop()

func countdown():
	currentTime -= 1
	var time_bar_progress = (currentTime/totalTime) * 100
	# llama  la funcion de clock para modificar el reloj
	$Clock.set_value(time_bar_progress) 

func reset():
	totalTime = 30

func _on_timer_timeout() -> void:
	game_time()

func _on_main_start_clock() -> void:
	#totalTime = seconds
	#sec = seconds
	#currentTime = totalTime
	#$Timer.start(seconds)
	get_tree().paused = false
	

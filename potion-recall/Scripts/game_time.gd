extends Node

var startTime: float = 30.0
var sec = startTime
var minute = 0.0
var currentTime = startTime

func _ready() -> void:
	$timeStatus.text = str(minute) + "0" + ":" + str(sec)
	$TimeBar.set_value(100)

func game_time():
	if sec > 0:
		sec -= 1
		countdown()
		$timeStatus.text = str(minute) + "0" + ":" + str(sec)
	else:
		sec = startTime - 1
		if minute > 0:
			minute -= 1
			$timeStatus.text = str(minute) + ":" + str(sec)
		else:
			$Timer.stop()

func countdown():
	currentTime -= 1
	var time_bar_progress = (currentTime/startTime) * 100
	$TimeBar.set_value(time_bar_progress)
	

func reset():
	startTime = 30

func _on_timer_timeout() -> void:
	game_time()

func _on_play_button_pressed() -> void:
	$Timer.start()

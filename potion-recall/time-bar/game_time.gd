extends Node

var startTime = 30
var sec = startTime
var minute = 0

func _on_start_game_button_pressed() -> void:
	$Timer.start()

func game_time():
	if sec > 0:
		sec -= 1
		$timeStatus.text = str(minute) + ":" + str(sec)
	else:
		sec = startTime - 1
		if minute > 0:
			minute -= 1
			$timeStatus.text = str(minute) + ":" + str(sec)
		else:
			$Timer.stop()

func reset():
	startTime = 60

func _on_timer_timeout() -> void:
	game_time()

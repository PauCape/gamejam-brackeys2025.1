extends Node
class_name DigitalClock

var time = 0
var sec = 0
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	
func time_to_string() -> String:
	var sec = fmod(time, 60)
	var min = time / 60
	
	var format_string = "%02d : %02d"
	var actual_string = format_string % [min, sec]
	return actual_string

#func stop_game():
	#sec = fmod(time, 60) # refactoriza setter sec
	#print(sec % 02d)
	
func reset():
	time = 0

func _on_start_game_button_pressed() -> void:
	reset()

extends Node2D
class_name ClockFace

enum {HOUR}
const HOUR_HAND_LENGTH = -70

@onready var hour_hand: Line2D = $Hand

var time = 0

func _physics_process(delta: float) -> void:
	time += delta
	hour_hand.points[1] = calculate_hand_tip_location(HOUR, time) # function aplies on second point of the line

#func hand_rotation(time) -> void:
	#hour_hand.points[1] = calculate_hand_tip_location(HOUR, time)

func reset():
	time = 0

func calculate_hand_tip_location(hand, time) -> Vector2:
	var length
	var angle
	
	match hand:
		HOUR:
			length = HOUR_HAND_LENGTH
			angle = deg_to_rad(time * 6)
			
	var x = length * sin(angle)
	var y = length * cos(angle)
	
	return Vector2(x, y)

func _on_start_game_button_pressed() -> void:
	reset()

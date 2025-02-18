extends Control
class_name HUD

@onready var digital_clock: Label = $DigitalClock
var digitalClock: DigitalClock

func _ready() -> void:
	digitalClock = get_tree().get_first_node_in_group("digitalclock")

func _process(delta: float) -> void:
	update_digital_clock_label()

func update_digital_clock_label():
	digital_clock.text = digitalClock.time_to_string()

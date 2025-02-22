extends Node

@onready var timeOutScreen: Control = $Wrong
@onready var music: AudioStreamPlayer2D = $Music

signal reloadList(levelNumber)
signal hideList
signal startClock
signal resetClock
signal win

var finalLevel = 4
var level = 1

func _ready() -> void:
	music.play()
	reloadList.emit(level)
	
	await get_tree().create_timer(4).timeout
	
	startClock.emit()
	hideList.emit()

func _on_random_list_completed_list() -> void:
	
	if level == finalLevel:
		win.emit()
		music.stop()
		resetClock.emit()
		return
	
	level = level + 1
	
	reloadList.emit(level)
	resetClock.emit()
	
	await get_tree().create_timer(4).timeout
	
	startClock.emit()
	hideList.emit()

func _on_random_list_bad_ingredient() -> void:
	music.stop()
	resetClock.emit()
	timeOutScreen.time_out_screen()

func _on_clock_clock_stopped() -> void:
	music.stop()
	timeOutScreen.time_out_screen()

func _on_clock_half_time() -> void:
	music.pitch_scale = 1.5

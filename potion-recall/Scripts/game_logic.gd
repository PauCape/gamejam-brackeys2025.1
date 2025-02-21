extends Node

@onready var timeOutScreen: Control = $Wrong

signal reloadList(levelNumber)
signal hideList
signal startClock
signal resetClock
signal win

var finalLevel = 1
var level = 1

func _ready() -> void:
	reloadList.emit(level)
	
	await get_tree().create_timer(4).timeout
	
	startClock.emit()
	hideList.emit()

func _on_random_list_completed_list() -> void:
	
	if level == finalLevel:
		win.emit()
		resetClock.emit()
		return
	
	level = level + 1
	
	reloadList.emit(level)
	resetClock.emit()
	
	await get_tree().create_timer(4).timeout
	
	startClock.emit()
	hideList.emit()

func _on_random_list_bad_ingredient() -> void:
	resetClock.emit()
	timeOutScreen.time_out_screen()

func _on_clock_clock_stopped() -> void:
	timeOutScreen.time_out_screen()

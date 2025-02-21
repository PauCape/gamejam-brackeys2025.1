extends Node

@onready var timeOutScreen: Control = $TimeOutScreen

signal reloadList(levelNumber)
signal hideList
signal startClock()

var finalLevel = 4
var level = 1

func _ready() -> void:
	reloadList.emit(level)
	
	await get_tree().create_timer(4).timeout
	
	startClock.emit()
	hideList.emit()

func _on_random_list_completed_list() -> void:
	
	if level == finalLevel:
		pass
	
	level = level + 1
	
	reloadList.emit(level)
	await get_tree().create_timer(4).timeout
	startClock.emit()
	hideList.emit()

func _on_random_list_bad_ingredient() -> void:
	pass # Replace with function body.
# Recibimos la condicion de que ha perdido

func _on_clock_clock_stopped() -> void:
	timeOutScreen.time_out_screen()

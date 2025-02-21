extends Node

signal reloadList(levelNumber)
signal hideList
signal startClock()

var finalLevel = 4
var level = 1

func _ready() -> void:
	reloadList.emit(level)
	
	startClock.emit()
	await get_tree().create_timer(4).timeout
	
	hideList.emit()

func _on_random_list_completed_list() -> void:
	
	if level == finalLevel:
		pass
	
	level = level + 1
	
	reloadList.emit(level)
	await get_tree().create_timer(4).timeout
	
	hideList.emit()

func _on_random_list_bad_ingredient() -> void:
	pass # Replace with function body.
# Recibimos la condicion de que ha perdido
# Enviar la señal de que hemos perdido

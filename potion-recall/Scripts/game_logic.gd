extends Node

signal reloadList(levelNumber)
signal hideList
signal startClock(seconds)

func _ready() -> void:
	reloadList.emit(1)
	
	# Podemos en marcha el reloj ()
	startClock.emit(5)
	await get_tree().create_timer(5).timeout
	
	hideList.emit()

# Recibimos la condicion de que la lista ha sido completada
# Enviar la señal de mostrar pantalla ganadora

# Recibimos la condicion de que ha perdido
# Enviar la señal de que hemos perdido

extends Node

signal reloadList(levelNumber)
signal hideList
signal startClock(seconds)

func _ready() -> void:
	reloadList.emit(1)
	
	# segundos para que se oculte la lista
	await get_tree().create_timer(2.0).timeout
	hideList.emit()
	
	# Podemos en marcha el reloj ()
	startClock.emit()

# Recibimos la condicion de que la lista ha sido completada
# Enviar la señal de mostrar pantalla ganadora

# Recibimos la condicion de que ha perdido
# Enviar la señal de que hemos perdido

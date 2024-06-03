extends Label

@onready var timer = $Timer
var elapsed_time = 0

signal game_over(survived_time)

func _ready():
	timer.wait_time = 1  # El timer se ejecutará cada segundo
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	timer.start()
	
	
func _on_Timer_timeout():
	elapsed_time += 1
	text = str(elapsed_time)
	
# Función para finalizar el juego y registrar el tiempo de supervivencia
func end_game():
	# Detener el temporizador
	timer.stop()
	# Obtener el tiempo de supervivencia
	var survived_time = elapsed_time
	print("Survived time:", survived_time)
	# Emitir una señal con el tiempo de supervivencia
	emit_signal("game_over", survived_time)
	

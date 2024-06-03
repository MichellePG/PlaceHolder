extends Label

@onready var timer = $Timer
var elapsed_time = 0

func _ready():
	timer.wait_time = 1  # El timer se ejecutará cada segundo
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	timer.start()

func _on_Timer_timeout():
	elapsed_time += 1
	text = str(elapsed_time)

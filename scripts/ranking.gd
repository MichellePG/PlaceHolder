extends Node

var best_time = 0
var times = []

const FILE_PATH = "user://ranking.save"

func _ready():
	load_ranking()

func add_time(time):
	times.append(time)
	if time > best_time:
		best_time = time
	print("Best time updated:", best_time)
	save_ranking()

func save_ranking():
	var data = {
		"best_time": best_time,
		"times": times
	}
	var json = JSON.new()
	var json_string = json.stringify(data)
	var file = FileAccess.open(FILE_PATH, FileAccess.WRITE)
	if file:
		file.store_line(json_string)
		file.close()
		print("Ranking saved successfully")
	else:
		print("Failed to open file for writing")	

func load_ranking():
	var file = FileAccess.open(FILE_PATH, FileAccess.READ)
	if file:
		best_time = 0
		var json_string = file.get_as_text()
		var json = JSON.new()
		var error = json.parse(json_string)
		if error == OK:
			var data = json.get_data()
			best_time = data.get("best_time", 0)
			times = data.get("times", [])
		file.close()
		print("Ranking loaded successfully")
	else:
		print("Failed to open file for reading")
		best_time = 0
		times = []	
		
# Función para manejar la señal emitida al final del juego
func _on_game_over(time):
	add_time(time)

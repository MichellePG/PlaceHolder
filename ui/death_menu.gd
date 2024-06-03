extends CanvasLayer

@onready var play_again = %PlayAgain
@onready var options = %Options
@onready var main_menu = %MainMenu
@onready var quit = %Quit

@onready var survived_time = %SurvivedTime
@onready var best_time = %BestTime
@onready var times_list = %TimesList

@onready var ranking = preload("res://scripts/ranking.tscn").instantiate()


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(ranking)
	play_again.pressed.connect(_on_play_again_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	quit.pressed.connect(_on_quit_pressed)
	update_ui()
	survived_time.connect("game_over", Callable(self, "end_game"))
	#set_survived_time()
	#get_node("/root/main").connect("game_over",  Callable(self, "set_survived_time"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/MenuInicial.tscn")


func _on_quit_pressed():
	get_tree().quit()


func set_survived_time():
	if survived_time:
		survived_time.text = "You survived: " + str(survived_time) + " seconds"
	#ranking.add_time(time)
	update_ui()

func update_ui():
	print("Updating UI")
	print("Best time:", ranking.best_time)
	times_list.clear()
	#for time in ranking.times:
	#	times_list.add_item(str(time) + " seconds")
	if best_time:
		best_time.text = "Best Time: " + str(ranking.best_time) + " seconds"
	else:
		print("Error: 'best_time' is not valid")

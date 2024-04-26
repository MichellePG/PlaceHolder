extends CanvasLayer

@onready var play_again = %PlayAgain
@onready var options = %Options
@onready var main_menu = %MainMenu
@onready var quit = %Quit


# Called when the node enters the scene tree for the first time.
func _ready():
	play_again.pressed.connect(_on_play_again_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	quit.pressed.connect(_on_quit_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/MenuInicial.tscn")


func _on_quit_pressed():
	get_tree().quit()

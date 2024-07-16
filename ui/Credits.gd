extends Control

@onready var back = %Back
@onready var quit = %Quit

# Called when the node enters the scene tree for the first time.
func _ready():
	
	back.pressed.connect(_on_back_pressed)
	quit.pressed.connect(_on_quit_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_back_pressed():
	get_tree().change_scene_to_file("res://ui/MenuInicial.tscn")

func _on_quit_pressed():
	get_tree().quit()

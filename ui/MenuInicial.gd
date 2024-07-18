extends MarginContainer


@onready var play = %Play
@onready var howtoplay = %HowToPlay
@onready var credits = %Credits
@onready var quit = %Quit


# Called when the node enters the scene tree for the first time.
func _ready():
	
	play.pressed.connect(_on_play_pressed)
	howtoplay.pressed.connect(_on_howtoplay_pressed)
	credits.pressed.connect(_on_credits_pressed)
	quit.pressed.connect(_on_quit_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_howtoplay_pressed():
	get_tree().change_scene_to_file("res://ui/HowToPlay.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://ui/Credits.tscn")

func _on_quit_pressed():
	get_tree().quit()

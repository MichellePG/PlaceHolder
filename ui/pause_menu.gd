extends CanvasLayer

@onready var resume = %Resume
@onready var options = %Options
@onready var main_menu = %MainMenu
@onready var quit = %Quit

@onready var audio = $MarginContainer/VBoxContainer/AudioButton

# Called when the node enters the scene tree for the first time.
func _ready():
	
	resume.pressed.connect(_on_resume_pressed)
	options.pressed.connect(_on_options_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	quit.pressed.connect(_on_quit_pressed)
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_resume_pressed():
	audio.play()
	get_tree().paused = false
	hide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused	

func _on_options_pressed():
	audio.play()

func _on_main_menu_pressed():
	get_tree().paused = false
	audio.play()
	get_tree().change_scene_to_file("res://ui/MenuInicial.tscn")


func _on_quit_pressed():
	get_tree().quit()

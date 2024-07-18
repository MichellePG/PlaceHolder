extends Control

@onready var back = %Back


# Called when the node enters the scene tree for the first time.
func _ready():
	back.pressed.connect(_on_back_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_back_pressed():
	get_tree().change_scene_to_file("res://ui/MenuInicial.tscn")

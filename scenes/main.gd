extends Node3D 

# Importa la definición de PlataformaBase
const PlataformaBase = preload("res://scenes/plataforma_base.gd")
var plataforma_base: PlataformaBase

func _ready():
	plataforma_base = PlataformaBase.new()
	add_child(plataforma_base)

func _input(event):
	if event.is_action_pressed("move_right"):
		crear_plataforma(Vector3(-2, 0, 0))
	elif event.is_action_pressed("move_left"):
		crear_plataforma(Vector3(2, 0, 0))
	elif event.is_action_pressed("move_forward"):
		crear_plataforma(Vector3(0, 0, -2))
	elif event.is_action_pressed("move_backward"):
		crear_plataforma(Vector3(0, 0, 2))

func crear_plataforma(direccion: Vector3):
	#plataforma_base.crear_nueva_plataforma(direccion)
	var nueva_plataforma = plataforma_base.crear_nueva_plataforma(direccion)

	

extends Node3D 

# Importa la definición de PlataformaBase
const PlataformaBase = preload("res://scenes/plataforma_base.gd")
@onready var plataforma_base: PlataformaBase  = PlataformaBase.new()
var cursor : Vector3 = Vector3(0, 0, -2)
func _ready():
	add_child(plataforma_base)
	plataforma_base.crear_nueva_plataforma(Vector3(0,0,0))
	#var cursor : Vector3 = Vector3(0,0,0)

func _input(event):
	if event.is_action_pressed("move_right"):
		plataforma_base.crear_plataformas_invisibles(Vector3(-2, 0, 0))
		cursor = Vector3(-2, 0, 0)
		#plataforma_base.crear_nueva_plataforma(Vector3(-2, 0, 0))
	elif event.is_action_pressed("move_left"):
		plataforma_base.crear_plataformas_invisibles(Vector3(2, 0, 0))
		cursor = Vector3(2, 0, 0)
	elif event.is_action_pressed("move_forward"):
		plataforma_base.crear_plataformas_invisibles(Vector3(0, 0, -2))
		cursor = Vector3(0, 0, -2)
	elif event.is_action_pressed("move_backward"):
		plataforma_base.crear_plataformas_invisibles(Vector3(0, 0, 2))
		cursor = Vector3(0, 0, 2)
	elif  event.is_action_pressed("place_platform"):
		plataforma_base.crear_nueva_plataforma(cursor)
		plataforma_base.crear_plataformas_invisibles(cursor)

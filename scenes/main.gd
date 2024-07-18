extends Node3D 

# Importa la definición de PlataformaBase
const PlataformaBase = preload("res://scenes/plataforma_base2.gd")
@onready var plataforma_base: PlataformaBase  = PlataformaBase.new()

#var ui: Control
@onready var ui = preload("res://ui/ui.tscn").instantiate()

#Ranking best
const RankingScene = preload("res://scripts/ranking.tscn")
@onready var ranking = RankingScene.instantiate()
#@onready var ranking_scene = preload("res://scripts/ranking.gd")

var cursor : Vector3 = Vector3(0, 0, -2)
@onready var personaje = $Robot

@onready var timer_label = $CanvasLayer/Label
var start_time = 0

func _ready():
	if not Music.playing:
		Music.play_music("main_theme")

	add_child(plataforma_base)
	add_child(ranking)
	plataforma_base.crear_nueva_plataforma(Vector3(0,0,0))
	add_child(ui)  # Añadir la UI 
	#update_platform_queue_ui()  # Actualizar la UI
	timer_label.connect("game_over", Callable(self, "_on_game_over"))

		
func update_platform_queue_ui():
	var platform_icons = []
	for platform in plataforma_base.cola_de_plataformas:
		platform_icons.append(platform.get_meta("icono"))
	ui.update_platform_queue(platform_icons)
	
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
		#update_platform_queue_ui()  # Actualizar la UI después de colocar una plataforma

func _process(_delta):
	if not Music.playing:
		Music.play_music("main_theme")
		
	if personaje.velocity.x == 0 and personaje.velocity.y == 0 and personaje.velocity.z == 0 and personaje.global_position.y <-0.5:
		#get_tree().change_scene_to_file("res://ui/death_menu.tscn")
		timer_label.end_game()
		
	
func _on_game_over(survived_time):
	ranking.add_time(survived_time)
	emit_signal("game_over", survived_time)
	get_tree().change_scene_to_file("res://ui/death_menu.tscn")

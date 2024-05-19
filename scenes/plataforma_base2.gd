extends Node3D

var plataforma_actual: Node3D
var ultima_plataforma: Node3D = null
@export var tipo_plataforma = "azul"
var cola_de_plataformas = []  # Nueva cola para plataformas
var escenas_de_plataformas = [
	preload("res://scenes/plataforma_base.tscn"),
	preload("res://scenes/plataforma_base2.tscn")
]

var iconos_de_plataformas = {
	"verde": preload("res://scenes/platform_iconverde.tscn"),
	"azul": preload("res://scenes/platform_iconazul.tscn")
}

func _ready():
	plataforma_actual = escenas_de_plataformas[0].instantiate()  # Inicia con la primera escena
	add_child(plataforma_actual)
	
	for _i in range(5):  
		añadir_a_cola()

func añadir_a_cola():
	var escena_aleatoria = escenas_de_plataformas[randi() % escenas_de_plataformas.size()].instantiate()
	
	#var escena_path = escenas_de_plataformas[indice].resource_path
	#var icono = iconos_de_plataformas["verde"]
	#escena_aleatoria.set_meta("icono", icono)
	
	cola_de_plataformas.append(escena_aleatoria)


func crear_nueva_plataforma(direccion: Vector3) -> Node3D:
	if cola_de_plataformas.size() > 0:
		var nueva_plataforma = cola_de_plataformas.pop_front()
		add_child(nueva_plataforma)
		if ultima_plataforma:
			nueva_plataforma.global_transform.origin = ultima_plataforma.to_global(direccion)
		else:
			nueva_plataforma.global_transform.origin = plataforma_actual.to_global(direccion)
		
		if plataforma_actual:
			remove_child(plataforma_actual)
		
		plataforma_actual = nueva_plataforma
		ultima_plataforma = nueva_plataforma
		añadir_a_cola()  # Añade una nueva plataforma a la cola para reemplazar la usada
		limpiar_plataformas_invisibles()
		crear_plataformas_invisibles(Vector3(0,0,-2))
		return nueva_plataforma
	else:
		# si no hay plataformas en la cola
		print("Error: No hay plataformas en la cola")
		return null


func limpiar_plataformas_invisibles():
	for child in get_children():
		if child.name.begins_with("PlataformaInvisible"):
			remove_child(child)

func crear_plataformas_invisibles(direccion : Vector3) :
	limpiar_plataformas_invisibles()
	var plataforma_invisible_scene = preload("res://scenes/plataforma_invisible.tscn")

	var ultima_plataforma = get_child(get_child_count() - 1)

	var plataforma_invisible = plataforma_invisible_scene.instantiate()
	plataforma_invisible.global_transform.origin = ultima_plataforma.to_global(direccion) 
	#plataforma_invisible.name = "PlataformaInvisibleDerecha"
	add_child(plataforma_invisible)

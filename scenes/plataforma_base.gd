extends Node3D

var plataforma_actual: Node3D


# Variable para mantener la referencia a la última plataforma creada
var ultima_plataforma: Node3D = null

func _ready():
	plataforma_actual = preload("res://scenes/plataforma_base.tscn").instantiate()
	add_child(plataforma_actual)

func crear_nueva_plataforma(direccion: Vector3) -> Node3D:
	# Instancia una nueva escena de plataforma
	var nueva_plataforma = plataforma_actual.duplicate()
	
	# Si hay una última plataforma, calculamos la posición relativa a ella
	if ultima_plataforma:
		nueva_plataforma.global_transform.origin = ultima_plataforma.to_global(direccion)
	else:
	# Si no hay última plataforma, calculamos la posición relativa a la base original
		nueva_plataforma.global_transform.origin = plataforma_actual.to_global(direccion)
		
	# Agrega la nueva plataforma como hijo de este nodo
	add_child(nueva_plataforma)
	
	# Elimina la plataforma anterior si existe
	if plataforma_actual:
		remove_child(plataforma_actual)
	
	# Establece la nueva plataforma como la plataforma actual
	plataforma_actual = nueva_plataforma

	# Actualiza la referencia a la última plataforma creada
	ultima_plataforma = nueva_plataforma
	
	limpiar_plataformas_invisibles()
	crear_plataformas_invisibles(Vector3(0,0,-2))
	
	return nueva_plataforma		


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

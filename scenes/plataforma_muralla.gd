extends Node3D

var plataforma_muralla_visual: Node3D

func _ready():
	plataforma_muralla_visual = Node3D.new()
	add_child(plataforma_muralla_visual)
	
	for child in get_children():
		if child != plataforma_muralla_visual:
			remove_child(child)
			plataforma_muralla_visual.add_child(child)
		
	rotar_aleatoriamente()

# Función para rotar la plataforma visualmente
func rotar_aleatoriamente():
	var angulos = [0, 90, 180, -90]
	var rotacion_aleatoria = angulos[randi() % angulos.size()]
	plataforma_muralla_visual.rotation_degrees.y = rotacion_aleatoria
	return rotacion_aleatoria

# Función para obtener la posición global de la plataforma (sin rotación visual)
func obtener_posicion_global():
	return global_transform.origin

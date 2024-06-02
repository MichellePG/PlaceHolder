extends Control

var platform_icons: Array = []

@onready var platform_queue_container = $VBoxContainer/PlatformQueueContainer

func _ready():
	update_platform_queue([])  # Limpia la cola de plataformas inicialmente


# Actualiza la cola de plataformas
func update_platform_queue(platforms: Array):

	for icon in platform_icons:
		icon.queue_free()
	platform_icons.clear()

	#for icon_scene in platforms:
	#	var icon_instance = icon_scene.instantiate()
	#	platform_icons.append(icon_instance)
	#	platform_queue_container.add_child(icon_instance)

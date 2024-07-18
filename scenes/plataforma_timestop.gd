extends Node3D

func _ready():
	$Area3D.connect("body_entered", Callable(self, "_on_body_entered"))
	#$Area3D.body_entered()
	print("Plataforma Timestop Ready")

func _on_body_entered(body):
	print("Algo ha tocado la plataforma Time-stop")
	body.add_to_group("robots")
	#body.ralentizar_personaje()
	#if body.is_in_group("robots"):
	#emit_signal(ralentizar_personaje())
	print("Personaje ha tocado la plataforma Time-stop")
	#	print("Personaje ha tocado la plataforma Time-stop")
	#	body._on_ralentizar_personaje()
	


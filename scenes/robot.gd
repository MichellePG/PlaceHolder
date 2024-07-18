extends CharacterBody3D
@onready var animation_player = $AnimationPlayer
@onready var audio = %jump

const SPEED = 2.0
const JUMP_VELOCITY = 5.0

var current_speed = SPEED
var current_jump_velocity = JUMP_VELOCITY

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var move_direction

func _ready():
	add_to_group("robots")
	connect("ralentizar_personaje", Callable(self, "_on_ralentizar_personaje"))
	print("Robot ready")

func _physics_process(delta):
	
	if global_position.y >-1.0:
		# Add the gravity.
		if not is_on_floor():
			velocity.y -= gravity * delta

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.

		if is_on_floor() :
			if animation_player.is_playing(): return
			# Choose a random direction
			var directions = [Vector3(1, 0, 0), Vector3(-1, 0, 0), Vector3(0, 0, 1), Vector3(0, 0, -1)]
			# Select a random direction from the remaining options
			var random_dir = directions[randi() % directions.size()]
			move_direction = random_dir
			
			# Jump before moving
			velocity.y = current_jump_velocity
			animation_player.play("Jump")
		# Move the character in the chosen direction
		if move_direction :
			velocity.x = move_direction.x * current_speed
			velocity.z = move_direction.z * current_speed

		else:
			velocity.x = move_toward(velocity.x, 0, current_speed)
			velocity.z = move_toward(velocity.z, 0, current_speed)

		move_and_slide()
		audio.play()
	else:
		velocity.x =0
		velocity.y =0
		velocity.z =0

func get_plataforma_actual():
	var espacio = get_world_3d().direct_space_state
	var params = PhysicsRayQueryParameters3D.new()
	params.from = global_position
	params.to = global_position - Vector3(0, 1, 0)
	var resultado = espacio.intersect_ray(params)
	
	if resultado:
		return resultado.collider
	return null
		
		

func _on_ralentizar_personaje():	
	print("Aplicando efecto Time-stop")
	current_speed = SPEED * 0.05
	current_jump_velocity = JUMP_VELOCITY * 0.05
	await get_tree().create_timer(5.0).timeout
	current_speed = SPEED
	current_jump_velocity = JUMP_VELOCITY
	print("Efecto Time-stop finalizado")	



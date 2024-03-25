extends Node3D

var speed = 5  # Mozgás sebessége
var mouse_delta = Vector2()
var sensitivity = 0.5

var velocity = Vector3()
const GRAVITY = -20.0
const JUMP_FORCE = 10


func _physics_process(delta):
	var camera = get_node("Camera3D")
	velocity.x = 0
	velocity.z = 0
	velocity.y = 0
	
	if Input.is_action_pressed("a"):
		velocity.x -= 10
	if Input.is_action_pressed("d"):
		velocity.x += 10
	if Input.is_action_pressed("w"):
		velocity.z -= 10
	if Input.is_action_pressed("s"):
		velocity.z += 10
		
	if  Input.is_action_just_pressed("jump"):
		global_position = Vector3(global_position.x, JUMP_FORCE, global_position.z)
	
	if global_position > Vector3(global_position.x,1,global_position.z):
		velocity.y = GRAVITY * delta
	
	velocity = velocity.normalized() * speed
	translate(velocity * delta)
	
	camera.rotation_degrees.y -= mouse_delta.x * sensitivity
	camera.rotation_degrees.x -= mouse_delta.y * sensitivity  # Fel-le nézés
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -180, 180)  # Korlátozás -90 és 90 fok közé
	
	mouse_delta = Vector2()
	
func _input(event):
	if event is InputEventMouseMotion:
		mouse_delta = event.relative
		

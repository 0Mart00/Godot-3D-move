extends Node3D

var speed = 5  # Mozgás sebessége
var mouse_delta = Vector2()
var sensitivity = 0.3

var velocity = Vector3()
const GRAVITY = -20.0
const JUMP_FORCE = 10


func _physics_process(delta):
	var camera = get_node("Camera3D")
	velocity = Vector3.ZERO
	
	var forward_direction = -camera.global_transform.basis.z.normalized()
	var right_direction = camera.global_transform.basis.x.normalized()
	if Input.is_action_pressed("w"):
		velocity += forward_direction
	if Input.is_action_pressed("s"):
		velocity -= forward_direction
	if Input.is_action_pressed("a"):
		velocity -= right_direction
	if Input.is_action_pressed("d"):
		velocity += right_direction
		
		
	var forgas = get_rotation()  #radian
	#var forgas = get_rotation()
	#var forgas = get_rotation_degrees()
	print(forgas)
	
	if  Input.is_action_just_pressed("jump"):
		global_position = Vector3(global_position.x, JUMP_FORCE, global_position.z)
	
	if global_position > Vector3(global_position.x,1,global_position.z):
		velocity.y = GRAVITY * delta
	
	velocity = velocity.normalized() * speed
	translate(velocity * delta)
	
	camera.rotation_degrees.y -= mouse_delta.x * sensitivity
	camera.rotation_degrees.x -= mouse_delta.y * sensitivity  
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -45, 45) 
	
	mouse_delta = Vector2()
	
func _input(event):
	if event is InputEventMouseMotion:
		mouse_delta = event.relative
		

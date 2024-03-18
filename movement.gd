extends MeshInstance3D

var speed = 5  

var velocity = Vector3()


func _physics_process(delta):
	velocity = Vector3.ZERO
	
	if Input.is_action_pressed("a"):
		velocity.x -= speed
	if Input.is_action_pressed("d"):
		velocity.x += speed
	if Input.is_action_pressed("w"):
		velocity.z -= speed
	if Input.is_action_pressed("s"):
		velocity.z += speed
		
	
	if velocity.length_squared() > 0:
		velocity = velocity.normalized() * speed
	translate(velocity * delta)

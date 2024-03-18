extends MeshInstance3D

var speed = 5  # Mozgás sebessége
var mouse_delta = Vector2()
var sensitivity = 0.1

func _physics_process(delta):
	var camera = get_node("Camera3D")
	camera.rotation_degrees.y -= mouse_delta.x * sensitivity
	camera.rotation_degrees.x -= mouse_delta.y * sensitivity  # Fel-le nézés
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -180, 180)  # Korlátozás -90 és 90 fok közé
	
	mouse_delta = Vector2()
func _input(event):
	if event is InputEventMouseMotion:
		mouse_delta = event.relative

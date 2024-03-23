extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var mesh_data = []
	mesh_data.resize(ArrayMesh.ARRAY_MAX)
	
	var vertices = PackedVector3Array()
	var indices = PackedInt32Array()
	
	for i in range(-100,100):
		vertices.append(Vector3(0, 0, 0))
		vertices.append(Vector3(0, 0, i))
		vertices.append(Vector3(i, 0, 0))
		
	

	for i in range(-100,100):
	
		indices.append(i)
		indices.append(i+1)
		indices.append(i+2)
	
		indices.append(i+1)
		indices.append(i+3)
		indices.append(i+2)
	mesh_data[ArrayMesh.ARRAY_VERTEX] = vertices
	mesh_data[ArrayMesh.ARRAY_INDEX] = indices

	mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, mesh_data)
	

extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var mesh_data = []
	mesh_data.resize(ArrayMesh.ARRAY_MAX)
	
	var vertices = PackedVector3Array()
	vertices.append(Vector3(0, 0, 0))
	vertices.append(Vector3(0, 1, 0))
	vertices.append(Vector3(1, 0, 0))
	
	#vertices.append(Vector3(3, 0, 0))
	#vertices.append(Vector3(0, 10, 0))
	#vertices.append(Vector3(10, 0, 0))
	mesh_data[ArrayMesh.ARRAY_VERTEX] = vertices

	var indices = PackedInt32Array()
	indices.append(0)
	indices.append(1)
	indices.append(2)
	
	#indices.append(1)
	#indices.append(3)
	#indices.append(2)
	
	mesh_data[ArrayMesh.ARRAY_INDEX] = indices

	mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, mesh_data)

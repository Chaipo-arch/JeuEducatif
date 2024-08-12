extends MeshInstance3D

static var mat
static var chemin = "shader_parameter/albedo"

# Called when the node enters the scene tree for the first time.
func _ready():
	mat = self.mesh.surface_get_material(0)
	


var i = 0
func _on_area_3d_body_entered(body):
	if i != 0:
		var base : = Color(0.171, 0.477, 0)
		var contact = Color(0.235, 0.624, 0)
		#self.set_instance_shader_parameter("albedo",contact)
		#mat.set_instance_shader_parameter()
		#mat.set_instance_shader_parameter("albedo",base)
		mat.set(chemin,contact) # Replace with function body.
	else : 
		i+= 1


func _on_area_3d_body_exited(body):
	
	
	var base : = Color(0.171, 0.477, 0)
	var contact = Color(0.235, 0.624, 0)
	#self.set_instance_shader_parameter("albedo",contact)
	mat.set(chemin,base) # Replace with function body.
	

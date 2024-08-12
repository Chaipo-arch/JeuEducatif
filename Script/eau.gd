extends MeshInstance3D
var shader = load("res://eau.gdshader")
static var mat
static var chemin = "shader_parameter/time_scale"
# Called when the node enters the scene tree for the first time.
func _ready():
	mat = self.mesh.surface_get_material(0)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
static func change(eventNum):
	var base = 0.025
	
	mat.set(chemin,base+ 0.025 * eventNum)
	mat.set("shader_parameter/texture_normal/bump_strength",5.3 + 3 * eventNum)

extends DirectionalLight3D

static var lum : DirectionalLight3D
# Called when the node enters the scene tree for the first time.
func _ready():
	lum = self
	print_debug(lum.light_color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
static func chan(event):
	
	var base = Color(0.6745,0.9176,0.9922,1)
	if event != 5:
		lum.light_color = base
	else:
		lum.light_color = Color(0.7608,0.9529,0.3647)
		
	

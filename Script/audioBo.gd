extends AudioStreamPlayer3D
static var audioStream3d  : AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready():
	audioStream3d = self
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change(pitch):
	self.pitch_scale = pitch
static func pla(eventNum):
	if(!audioStream3d.playing):
		audioStream3d.play()
	var base = 0.75
	audioStream3d.pitch_scale= base + (0.07 *eventNum)


func _on_finished():
	await get_tree().create_timer(1).timeout
	audioStream3d.play() # Replace with function body.

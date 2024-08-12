extends CollisionShape3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	self.disabled = false # Replace with function body
	await get_tree().create_timer(1).timeout
	self.disabled = true

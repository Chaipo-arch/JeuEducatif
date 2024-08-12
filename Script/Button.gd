extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	#self.show() # Replace with function body.
	pass

func _on_pressed():
	self.hide() # Replace with function body.


func _on_timer_tree_exiting():
	self.show() # Replace with function body.

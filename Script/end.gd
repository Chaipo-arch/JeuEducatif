extends CollisionShape2D
func _ready():
	pass
	
	
func setVisible(visible : bool) :
	self.show()
	

func _on_area_3d_body_entered(body):
	#setVisible(true) # Replace with function body.
	pass

func _on_button_pressed():
	self.hide() # Replace with function body.

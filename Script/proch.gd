extends Label

static var score : Label
static var multiplicateur : Label

func _ready():
	score= self
	multiplicateur = self
	

func changeTe(text: String):
	if score != null:
		score.text = text
	else:
		score = self 
		score.text = text
	score.get_parent().show()
	score.show()
	
	score.set_visibility_layer_bit(1,visible)
static func change(text:String):
	score.text = text
	score.show()


func _on_timer_tree_exiting():
	score.text = str(0) # Replace with function body.

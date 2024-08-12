extends Label
static var re4 : Label


func _ready():
	re4= self
	

func changeTe(text: String):
	if re4 != null:
		re4.text = text
	else:
		re4 = self 
		re4.text = text
	re4.get_parent().show()
	re4.show()
	
	re4.set_visibility_layer_bit(1,visible)
static func change(text:String):
	re4.text = text
	re4.show()

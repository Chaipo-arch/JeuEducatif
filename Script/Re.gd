extends Label
static var re1 : Label


func _ready():
	re1 = self

	

func changeTe(text: String):
	if re1 != null:
		re1.text = text
	else:
		re1 = self 
		re1.text = text
	
	re1.show()
	
	re1.set_visibility_layer_bit(1,true)
static func change(text:String):
	re1.text = text
	re1.show()

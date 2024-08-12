extends Label

static var re3 : Label


func _ready():
	re3 = self
	

func changeTe(text: String):
	if re3 != null:
		re3.text = text
	else:
		re3 = self 
		re3.text = text
static func change(text:String):
	re3.text = text
	re3.show()

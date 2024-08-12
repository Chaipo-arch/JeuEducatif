extends Label

static var re2 : Label


func _ready():
	re2 = self
	
func changeTe(text: String):
	if re2 != null:
		re2.text = text
	else:
		re2 = self 
		re2.text = text
static func change(text:String):
	re2.text = text
	re2.show()

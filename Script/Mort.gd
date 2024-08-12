extends Label

const Question = preload("res://Question.gd")
const Re1 = preload("res://Re.gd")
const Re2 = preload("res://Re2.gd")
const Re3 = preload("res://Re3.gd")
const Re4 = preload("res://Re4.gd")
const P1 = preload("res://P1.gd")
const p2 = preload("res://p2.gd")
const p3 = preload("res://P3.gd")
const P4 = preload("res://P4.gd")
var questionLabel : Label
var gameOver = "FAME OVER"

func _ready():
	questionLabel = self

func setVisible(visible : bool) :
	questionLabel.get_parent().show()
	questionLabel.show()	
	questionLabel.set_visibility_layer_bit(1,visible)

func _on_area_3d_body_entered(body):
	if body.is_in_group("Joueur"):
		#setVisible(true)
		pass

func _on_button_pressed():
	questionLabel.hide() # Replace with function body.


func _on_timer_tree_exiting():
	setVisible(true) # Replace with function body.


func _on_question_focus_exited():
	setVisible(true) # Replace with function body.

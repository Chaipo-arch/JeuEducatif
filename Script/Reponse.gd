extends Node

class Reponse :
	var correct = false
	var text : String
	
	func getR() :
		return correct
		
	func _init(text: String, correct: bool):
		self.text = text 
		self.correct = correct

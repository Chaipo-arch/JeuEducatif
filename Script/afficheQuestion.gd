extends Label
var gameOver = false
const Question = preload("res://Question.gd")
const Re1 = preload("res://Re.gd")
const pro = preload("res://proch.gd")
const Re2 = preload("res://Re2.gd")
const Re3 = preload("res://Re3.gd")
const Re4 = preload("res://Re4.gd")
const P1 = preload("res://P1.gd")
const p2 = preload("res://p2.gd")
const p3 = preload("res://P3.gd")
const P4 = preload("res://P4.gd")
const Score = preload("res://score.gd")
const Audio = preload("res://audioBo.gd")
const eau = preload("res://eau.gd")
const lum = preload("res://lum.gd")
const multi= preload("res://Multiplicateur.gd")
const timer= preload("res://Timer.gd")
var questionLabel : Label
var score =0
var serie = 0
var nbQuestion = 0

func _ready():
	questionLabel = self
	assign()
	
func setVisible(visible : bool) :	
	questionLabel.get_parent().show()
	questionLabel.show()
	questionLabel.set_visibility_layer_bit(1,visible)

func assign():
	var q = Question.choseAleaQ2()
	var r1 = Re1.new()
	var index = randi() % 4
	nbQuestion = nbQuestion +1
	if(index == 0):
		Re1.change(q.correcte)
		Re2.change(q.ReponsesFausses[0])
		Re3.change(q.ReponsesFausses[1])
		Re4.change(q.ReponsesFausses[2])
		P1.doitBouger = true
		p2.doitBouger = false
		p3.doitBouger = true
		P4.doitBouger = true
	elif (index == 1):
		Re2.change(q.correcte)
		Re1.change(q.ReponsesFausses[0])
		Re3.change(q.ReponsesFausses[1])
		Re4.change(q.ReponsesFausses[2])
		P1.doitBouger = true
		p2.doitBouger = true
		p3.doitBouger = false
		P4.doitBouger = true
	elif (index == 2):
		Re3.change(q.correcte)
		Re2.change(q.ReponsesFausses[0])
		Re1.change(q.ReponsesFausses[1])
		Re4.change(q.ReponsesFausses[2])
		P1.doitBouger = false
		p2.doitBouger = true
		p3.doitBouger = true
		P4.doitBouger = true
	else :
		Re4.change(q.correcte)
		Re2.change(q.ReponsesFausses[0])
		Re3.change(q.ReponsesFausses[1])
		Re1.change(q.ReponsesFausses[2])
		P1.doitBouger = true
		p2.doitBouger = true
		p3.doitBouger = true
		P4.doitBouger = false
	changeText(q.textQuestion)
	setVisible(true)
	
func changeText(newText : String) :
	questionLabel.text = newText
	
func incScore():
	if !gameOver:
		if serie <5:
			serie = serie +1
		score =  score + 1* serie
		event(serie)
		Score.change(str(score)+" X" +str(serie))
		
func _on_timer_timeout():
	nbQuestion = nbQuestion +1
	await get_tree().create_timer(5).timeout
	if !gameOver:
		if serie <5:
			serie = serie +1
			if serie <5:
				pro.change(">" +str(serie+1))
		score =  score + 1* serie
		event(serie)
		Score.change(str(score))
		multi.change("X" +str(serie))
		if nbQuestion < 27 :
			var q =  Question.choseAleaQ2()
			var r1 = Re1.new()
			var index = randi() % 4
			if(index == 0):
				Re1.change(q.correcte)
				
				Re2.change(q.ReponsesFausses[0])
				Re3.change(q.ReponsesFausses[1])
				Re4.change(q.ReponsesFausses[2])
				P1.doitBouger = true
				p2.doitBouger = false
				p3.doitBouger = true
				P4.doitBouger = true
			elif (index == 2):
				Re2.change(q.correcte)
				Re1.change(q.ReponsesFausses[0])
				Re3.change(q.ReponsesFausses[1])
				Re4.change(q.ReponsesFausses[2])
				P1.doitBouger = true
				p2.doitBouger = true
				p3.doitBouger = false
				P4.doitBouger = true
			elif (index == 3):
				Re3.change(q.correcte)
				Re2.change(q.ReponsesFausses[0])
				Re1.change(q.ReponsesFausses[1])
				Re4.change(q.ReponsesFausses[2])
				P1.doitBouger = false
				p2.doitBouger = true
				p3.doitBouger = true
				P4.doitBouger = true
			else :
				Re4.change(q.correcte)
				Re2.change(q.ReponsesFausses[0])
				Re3.change(q.ReponsesFausses[1])
				Re1.change(q.ReponsesFausses[2])
				P1.doitBouger = true
				p2.doitBouger = true
				p3.doitBouger = true
				P4.doitBouger = false
			changeText(q.textQuestion)
			setVisible(true)
			emit_signal("newTimer")
		else :
			emit_signal("focus_exited")
	else : 
		if nbQuestion < 27:
			gameOver = false
			serie = 0
			Score.change(str(score))
			pro.change("")
			multi.change("X1")
			assign()
			event(serie)
		else :
			emit_signal("focus_exited")
	
		
func _on_area_3d_body_entered(body):
	gameOver = true

func _on_button_pressed():
	assign() # Replace with function body.
	gameOver = false

func event(eventNum : int ):
	Audio.pla(eventNum)
	eau.change(eventNum)
	lum.chan(eventNum)
	timer.changeVitesse(eventNum)
	

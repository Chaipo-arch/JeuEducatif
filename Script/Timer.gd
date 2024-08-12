extends Timer

var timer_label : Label
static var game_timer : Timer
var remainingTime : int = 20
const Reponse = preload("res://Reponse.gd")
var gameOver = false
var partieTerm = false

func _ready():
	timer_label = Label.new()
	timer_label.label_settings = LabelSettings.new()
	timer_label.label_settings.font_size = 30
	timer_label.set_position(Vector2(150,15))
	add_child(timer_label)
	update_timer_label()
	
	game_timer = Timer.new()
	game_timer.one_shot = false
	game_timer.wait_time = 1
	add_child(game_timer)
	game_timer.connect("timeout", Callable(self, "_on_game_timer_timeout"))
	game_timer.start()
	#call("setReponse",Reponse.new()) 
	#Reponse.new().setReponse() 
	
func launchTimer(int):
	if !partieTerm :
		remainingTime = int
		timer_label = Label.new()
		add_child(timer_label)
		update_timer_label()
		
		game_timer = Timer.new()
		game_timer.one_shot = false
		game_timer.wait_time = 1.0
		add_child(game_timer)
		game_timer.connect("timeout", Callable(self, "_on_game_timer_timeout"))
		game_timer.start()
	
func _on_game_timer_timeout():
	if !partieTerm :
		if remainingTime > 0:
			remainingTime -=1
			update_timer_label()
		else:
			emit_signal("timeout")
			remainingTime = 20
			game_timer.stop()
			await get_tree().create_timer(5).timeout
			if(gameOver):
				emit_signal("ready")
				gameOver = false
			if !gameOver :
				game_timer.start()
		
func update_timer_label():
	if !partieTerm :
		var minutes = remainingTime/60
		var seconds = remainingTime%60
		timer_label.text = str(seconds)

func _on_LabR_newTimer():
	pass


func _on_area_3d_body_entered(body):
	print_debug("mort?")
	gameOver = true


func _on_button_pressed():
	remainingTime = 10
	game_timer.start() # Replace with function body.
	gameOver = false


func _on_question_focus_exited():
	partieTerm = true # Replace with function body.
static func changeVitesse(eventNum):
	if(eventNum !=5):
		game_timer.wait_time = 1 * eventNum*2/100
	else:
		game_timer.wait_time = 0.8

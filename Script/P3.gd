
extends Node3D


static var doitBouger = true
func _on_timer_timeout():
	if doitBouger :
		start_tween()
		await(4)
		tween.stop()
	
	
var tween_duration = 3
var elapsed_time = 0
var is_moving = false

func _process(delta):
	if is_moving:
		elapsed_time += delta
		var t : float = min(1, elapsed_time / tween_duration)
		self.transform.origin.y = -t * 10
		
		if t == 1:
			is_moving = false
			await(1)
			reverseMov()

func start_movement():
	if not is_moving and doitBouger:
		is_moving = true
		elapsed_time = 0
		
@export var offset = Vector3(0, -3,0)
@export var duration = 2.0
var tween 
func start_tween():
	tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(self, "position", offset, duration / 2)
	start_movement()
	
	
func reverseMov():
	while self.transform.origin.y < 0 :
		var movement = self.transform.origin.y
		self.transform.origin.y =  self.transform.origin.y + 0.1
		
		
		#todo meilleur transition
		

func _on_timeout():
	# Cette fonction sera appelée lorsque le temporisateur déclenche son signal "timeout"
	pass


extends AnimatedSprite

var perfect = false
var good = false
var great = false
var current_note = null

var is_pressed = false

export(int, 1, 4) var lane


func _input(event):
	match lane:
		1:
			if event.is_action_pressed("d_key"):
				is_pressed = true
			elif event.is_action_released("d_key"):
				is_pressed = false
		2:
			if event.is_action_pressed("f_key"):
				is_pressed = true
			elif event.is_action_released("f_key"):
				is_pressed = false
		3:
			if event.is_action_pressed("j_key"):
				is_pressed = true
			elif event.is_action_released("j_key"):
				is_pressed = false
		4:
			if event.is_action_pressed("k_key"):
				is_pressed = true
			elif event.is_action_released("k_key"):
				is_pressed = false
	
func _process(delta):
	if is_pressed:
		self.frame = 1
	else:
		self.frame = 0
	
func _on_PerfectArea_area_entered(area):
	if area.is_in_group("note_group"):
		perfect = true


func _on_PerfectArea_area_exited(area):
	if area.is_in_group("note_group"):
		perfect = false


func _on_GoodArea_area_entered(area):
	if area.is_in_group("note_group"):
		good = true


func _on_GoodArea_area_exited(area):
	if area.is_in_group("note_group"):
		good = false


func _on_GreatArea_area_entered(area):
	if area.is_in_group("note_group"):
		great = true
		current_note = area


func _on_GreatArea_area_exited(area):
	if area.is_in_group("note_group"):
		great = false
		current_note = null


func _on_PushTimer_timeout():
	pass


func _reset():
	current_note = null
	perfect = false
	good = false
	great = false

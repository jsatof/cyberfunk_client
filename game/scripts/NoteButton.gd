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


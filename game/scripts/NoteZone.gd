extends ColorRect

var is_pressed = false
export(int, 1, 4) var lane

func _ready():
	self.color = Color("00c0c0c0")

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
		self.color = Color("c0c0c0")
	else:
		self.color = Color("00c0c0c0")

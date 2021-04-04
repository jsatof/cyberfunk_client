extends Area2D

export(int, 1, 4) var lane 
var y_pos = 0
var bar_padding = 20

func _ready():
	set_sprite_frame()
	set_spawn_position()

func set_sprite_frame():
	if lane == 1 or lane == 4:
		$AnimatedSprite.frame = 0
	elif lane == 2 or lane == 3:
		$AnimatedSprite.frame = 1

func set_spawn_position():
	var x
	match self.lane:
		1:
			x = -53
		2:
			x = -18
		3:
			x = 15.5
		4:
			x = 50
	
	self.position = Vector2(x, -self.y_pos - self.bar_padding)

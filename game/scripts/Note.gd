extends Area2D

export(int, 1, 4) var lane 

enum State { PERFECT, GREAT, GOOD, MISS }

var y_pos = 0
var bar_padding = 25

var is_colliding = false
var is_collected = false
var point_value = 0
var hit_state = State.MISS

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
		# coords for each lane relative to bar node (not pixel-perfect but whatever)
		1:
			x = -53
		2:
			x = -18
		3:
			x = 15.5
		4:
			x = 50
	
	self.position = Vector2(x, -self.y_pos - self.bar_padding)

func _process(delta):
	collect()

var note_button

func collect():
	if !is_collected:
		if is_colliding and note_button:
			if note_button.is_collecting:
				is_collected = true
				note_button.is_collecting = false
				
				match self.hit_state:
					State.PERFECT:
						Stats.perfect_count += 1
					State.GREAT:
						Stats.great_count += 1
					State.GOOD:
						Stats.good_count += 1
				
				self.hide()

func _on_Note_area_entered(area):
	if area.is_in_group("perfect_area"):
		is_colliding = true
		note_button = area.get_parent()
		self.point_value = 100
		self.hit_state = State.PERFECT
		
	elif area.is_in_group("great_area"):
		is_colliding = true
		note_button = area.get_parent()
		self.point_value = 50
		self.hit_state = State.GREAT
		
	elif area.is_in_group("good_area"):
		is_colliding = true
		note_button = area.get_parent()
		self.point_value = 25
		self.hit_state = State.GOOD
		
func _on_Note_area_exited(area):
	if area.is_in_group("perfect_area") or area.is_in_group("great_area") or area.is_in_group("good_area"):
		is_colliding = false
		self.point_value = 0

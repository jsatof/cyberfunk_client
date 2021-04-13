extends Node2D

onready var audio_player = $AudioStreamPlayer

var speed
var is_started
var pre_start_duration
var start_pos_sec

var pre_start_pad = 50

func _ready():
	pass
	
func _process(delta):
	if not is_started:
		pre_start_duration -= speed * delta
		if pre_start_duration <= 0:
			start()
			return

func setup(gameplay_node):
	audio_player.stream = gameplay_node.audio_file
	speed = gameplay_node.scroll_speed
	is_started = false
	pre_start_duration = gameplay_node.bar_length + pre_start_pad
	start_pos_sec  = gameplay_node.start_pos_sec

func start():
	self.is_started = true
	audio_player.play(self.start_pos_sec)

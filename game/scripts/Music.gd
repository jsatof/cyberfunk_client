extends Node2D

onready var audio_player = $AudioStreamPlayer

var scroll_speed
var is_started
var pre_start_duration
var start_pos_sec

var pre_start_pad = 0.63

func _ready():
	audio_player.stream = SongInfo.song_file
	is_started = false
	pre_start_duration = SongInfo.bar_length * pre_start_pad
	
func _process(delta):
	if not is_started:
		pre_start_duration -= scroll_speed * delta
		if pre_start_duration <= 0:
			start()
			return

func set_scroll_speed(rate):
	scroll_speed = rate

func set_start_pos(sec):
	start_pos_sec = sec

func start():
	self.is_started = true
	audio_player.play(self.start_pos_sec)

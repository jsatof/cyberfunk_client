extends AudioStreamPlayer

export var bpm := 99
export var measures := 4

var song_beat_position = 1
var song_position = 0.0
var beats_before_start = 0
var sec_per_beat = 60.0 / bpm

var last_reported_beat = 0
var current_measure = 1

var closest_beat = 1
var time_from_closest_beat = 0.0

signal beat(position)
signal measure(position)

func _physics_process(delta):
	if self.playing:
		song_position = self.get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		song_beat_position = int(floor(song_position / sec_per_beat)) + beats_before_start
		_report_beat()
		
func _report_beat():
	if last_reported_beat < song_beat_position:
		if current_measure > measures:
			current_measure = 1
		emit_signal("beat", song_beat_position)
		emit_signal("measure", current_measure)
		last_reported_beat = song_beat_position
		current_measure += 1
		print("\nBeat: %d\nMeasure: %d\n" % [last_reported_beat, current_measure])
		
func set_beat_offset(x):
	beats_before_start = x
	$Timer.wait_time = sec_per_beat
	$Timer.start()
	
func play_from_beat(beat, offset):
	self.play()
	seek(beat * sec_per_beat)
	beats_before_start = offset
	current_measure = beat % measures
	
func _on_Timer_timeout():
	song_beat_position += 1
	if song_beat_position < beats_before_start - 1:
		$Timer.start()
	elif song_beat_position == beats_before_start - 1:
		$Timer.wait_time -= (AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency())
		$Timer.start()
	else:
		self.play()
		$Timer.stop()
	_report_beat()

extends Node2D

onready var music_node = $Music
onready var conveyor_node = $Conveyor

var quarter_note_sec
var start_pos_sec
var scroll_speed

func _ready():
	quarter_note_sec = 60.0 / float(SongInfo.tempo) # 60 BPM = 1 Beat per Second
	scroll_speed = SongInfo.bar_length / float(4 * quarter_note_sec)
	start_pos_sec = 0.1
	
	music_node.set_scroll_speed(scroll_speed)
	music_node.set_start_pos(start_pos_sec)
	
	conveyor_node.set_scroll_speed(scroll_speed)
	conveyor_node.initial_bar_spawn()

func _process(delta):
	$StatsRect/ScoreValueLabel.text = str(Stats.score)
	$StatsRect/ComboValueLabel.text = str(Stats.combo)
	
	$Counters/PerfectCountLabel.text = str(Stats.perfect_count)
	$Counters/GreatCountLabel.text = str(Stats.great_count)
	$Counters/GoodCountLabel.text = str(Stats.good_count)
	$Counters/MissCountLabel.text = str(Stats.miss_count)

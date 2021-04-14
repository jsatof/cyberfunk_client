extends Node2D

onready var music_node = $Music
onready var conveyor_node = $Conveyor

var audio_file
var tempo
var quarter_note_sec
var start_pos_sec
var scroll_speed #= 75


func _ready():
	audio_file = load("res://assets/Pure_Indigo_In_My_Bed.ogg")
	
	tempo = 100 # The song is 100 BPM
	quarter_note_sec = 60.0 / float(tempo) # 60 BPM = 1 Beat per Second
	scroll_speed = SongInfo.bar_length / float(4 * quarter_note_sec)
	start_pos_sec = 0.1
	
	music_node.setup(self)
	conveyor_node.setup(self)

func _process(delta):
	$StatsRect/ScoreValueLabel.text = str(Stats.score)
	$StatsRect/ComboValueLabel.text = str(Stats.combo)
	
	$Counters/PerfectCountLabel.text = str(Stats.perfect_count)
	$Counters/GreatCountLabel.text = str(Stats.great_count)
	$Counters/GoodCountLabel.text = str(Stats.good_count)
	$Counters/MissCountLabel.text = str(Stats.miss_count)

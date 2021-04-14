extends Node2D

onready var music_node = $Music
onready var conveyor_node = $Conveyor

var bar_length = 200
var audio_file
var tempo
var quarter_note_sec
var start_pos_sec
var scroll_speed #= 75


func _ready():
	audio_file = load("res://assets/Pure_Indigo_In_My_Bed.ogg")
	
	tempo = 100 # The song is 100 BPM
	quarter_note_sec = 60.0 / float(tempo) # 60 BPM = 1 Beat per Second
	scroll_speed = bar_length / float(4 * quarter_note_sec)
	start_pos_sec = 0.1
	
	music_node.setup(self)
	conveyor_node.setup(self)

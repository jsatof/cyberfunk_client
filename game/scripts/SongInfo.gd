extends Node2D

var map_file
var song_file
var song_map
var tempo

var bar_length = 400

# STUB: handle variable song/beatmaps

func _ready():
	song_file = load("res://assets/Pure_Indigo_In_My_Bed.ogg")
	assert(song_file != null)
	
	song_file.loop = false
	
	map_file = "res://assets/in_my_bed_map.mboy"
	
	tempo = 100


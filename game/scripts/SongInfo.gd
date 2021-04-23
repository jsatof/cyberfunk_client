extends Node2D

var map_file
var song_file
var song_map
var tempo

var bar_length = 400

func _ready():
	song_file = load("res://assets/Pure_Indigo_In_My_Bed.ogg")
	map_file = "res://assets/in_my_bed_map.mboy"
	song_map = load_songmap(map_file)
	
	tempo = song_map.tempo


func load_songmap(path):
	var file = File.new()
	file.open(path, File.READ)
	var content = file.get_as_text()
	file.close()
	return JSON.parse(content).get_result()


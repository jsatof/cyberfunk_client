extends Node2D

var note_scene = preload("res://scenes/Note.tscn")

var notes_data = [
	{
		"pos": 0,
	},
	{
		"pos": 50,
	},
	{
		"pos": 100,
	},
	{
		"pos": 150,
	},
]

func _ready():
	spawn_notes()
	
func spawn_notes():
	for n in notes_data:
		randomize()
		var note = note_scene.instance()
		note.lane = randi() % 4 + 1
		note.y_pos = n.pos
		add_child(note)

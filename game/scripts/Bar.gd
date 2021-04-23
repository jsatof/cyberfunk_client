extends Node2D

var note_scene = preload("res://scenes/Note.tscn")

var notes_data = [{"pos": 0}, {"pos": 50},{"pos": 100},{"pos": 150}]

# need positions for 16th notes based on bar_length
var note_slots = get_note_slot_positions(SongInfo.bar_length)


func _ready():
	spawn_notes()
	
func spawn_notes():
	for i in range(note_slots.size()):
		randomize()
		if i % 4 == 0:
			var note = note_scene.instance()
			note.y_pos = note_slots[i]
			note.lane = randi() % 4 + 1
			add_child(note)

# generates array splitting the value of bar_length 
func get_note_slot_positions(bar_length):
	var output = []
	
	var interval = float(bar_length / 16.0)
	
	for i in range(16):
		output.append(float(i * interval))
	
	return output

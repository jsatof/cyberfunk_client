extends Node

# This is a Singleton to store the stats of a player's performance
# A singleton is like a global scene in Godot, it's accessible from any other scene

var score = 0
var combo = 0
var perfect_count = 0
var great_count = 0
var good_count = 0
var miss_count = 0
var max_combo = 0

var total_notes = 0
var accuracy = 0.0

func _process(delta):
	if combo >= max_combo:
		max_combo = combo
		
	total_notes = perfect_count + great_count + good_count + miss_count
	
	if total_notes <= 0:
		accuracy = float((perfect_count + great_count + good_count) / 1.0)
	else:
		accuracy = float((perfect_count + great_count + good_count) / float(total_notes))

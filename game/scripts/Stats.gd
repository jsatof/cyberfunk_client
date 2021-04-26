extends Node

# This is a Singleton to store the stats of a player's performance
# A singleton is like a global scene in Godot, it's accessible from any other scene

var score = 0
var combo = 0
var accuracy = 0.0
var perfect_count = 0
var great_count = 0
var good_count = 0
var miss_count = 0
var max_combo = 0

func _process(delta):
	if combo >= max_combo:
		max_combo = combo

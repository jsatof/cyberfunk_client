extends Control

# set Stats scene back to default values
func _ready():
	Stats.score = 0
	Stats.combo = 0
	Stats.perfect_count = 0
	Stats.great_count = 0
	Stats.good_count = 0
	Stats.miss_count = 0
	Stats.max_combo = 0
	
	Stats.accuracy = 0.0
	Stats.total_notes = 0

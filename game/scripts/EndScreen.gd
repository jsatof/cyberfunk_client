extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreVariable.text = str(Stats.score)
	$ComboVariable.text = str(Stats.combo)
	
	$PerfectVariable.text = str(Stats.perfect_count)
	$GreatVariable.text = str(Stats.great_count)
	$GoodVariable.text = str(Stats.good_count)
	$MissVariable.text = str(Stats.miss_count)

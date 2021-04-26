extends Control

onready var http_request = HTTPRequest.new()
var grade

func _ready():
	$ScoreVariable.text = str(Stats.score)
	$ComboVariable.text = str(Stats.combo)
	$MaxComboVariable.text = str(Stats.max_combo)
	$PerfectVariable.text = str(Stats.perfect_count)
	$GreatVariable.text = str(Stats.great_count)
	$GoodVariable.text = str(Stats.good_count)
	$MissVariable.text = str(Stats.miss_count)
	$AccuracyVariable.text = str(Stats.accuracy)

	var font_color = Color(0,0,0)
	if Stats.accuracy == 1.0:
		grade = "S"
		font_color = Color(245, 226, 22) # gold
	elif Stats.accuracy < 1 and Stats.accuracy >= 0.9:
		grade = "A"
		font_color = Color(21, 230, 45) # green
	elif Stats.accuracy < 0.9 and Stats.accuracy >= 0.8:
		grade = "B"
		font_color = Color(17, 84, 209) # blue
	elif Stats.accuracy < 0.8 and Stats.accuracy >= 0.7:
		grade = "C"
		font_color = Color(209, 103, 17) # orange
	elif Stats.accuracy < 0.7:
		grade = "D"
		font_color = Color(209, 17, 17) # red

	$GradeLabel.set("custom_colors/font_color", font_color)
	$GradeLabel.text = grade
	
	add_child(http_request)
	http_request.connect("request_completed", self, "_http_request_completed")
	upload_score()

func upload_score():
	var url = "http://ec2-3-140-247-200.us-east-2.compute.amazonaws.com/submit_score"
	var headers = ["Content-Type: application/json"]
	var use_ssl = false
	
	var body = {
		"username": "anon",
		"score": Stats.score,
		"accuracy": Stats.accuracy,
		"max_combo": Stats.max_combo,
		"grade": grade
	}

	var error = http_request.request(url, headers, use_ssl, HTTPClient.METHOD_POST, to_json(body))
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func _http_request_completed(result, response_code, headers, body):
	var response = parse_json(body.get_string_from_utf8())
	print(response)

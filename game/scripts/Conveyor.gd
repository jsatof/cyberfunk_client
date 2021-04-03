extends Node2D

onready var bars_node = $Bar
var bar_scene = preload("res://scenes/Bar.tscn")
var bars = []

var bar_length = 200
var scroll_speed = 15

func _ready():
	for i in range(1):
		add_bar()
	
func _process(delta):
	bars_node.position += Vector2(0, scroll_speed) * delta

func add_bar():
	var bar = bar_scene.instance()
	bar.position = Vector2(0,0)
	bars.append(bar)
	bars_node.add_child(bar)
	bar.position += Vector2(0, -bar_length)

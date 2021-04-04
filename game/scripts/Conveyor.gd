extends Node2D

onready var bars_node = $Bar
var bar_scene = preload("res://scenes/Bar.tscn")
var bars = []

var bar_length = 200
var scroll_speed = 30
var current_position = Vector2(0, -bar_length)

#var bar_despawn_point = bar_length + 100

func _ready():
	for i in range(1):
		spawn_bar()
	
func _process(delta):
	bars_node.position += Vector2(0, scroll_speed) * delta

	for bar in bars:
		if bar.position.y + bars_node.position.y >= bar_length + 50:
			despawn_bar(bar)
			spawn_bar()

func spawn_bar():
	var bar = bar_scene.instance()
	bar.position = Vector2(0, current_position.y)
	bars.append(bar)
	bars_node.add_child(bar)
	current_position += Vector2(0, -bar_length)

func despawn_bar(bar):
	bar.visible = false
	bar.queue_free()
	bars.erase(bar)

extends Node2D

onready var bars_node = $Bar

var bar_scene = preload("res://scenes/Bar.tscn")
var bars = []

var current_position
var bar_despawn_point 
var scroll_speed

func _ready():
	bar_despawn_point = 2 * SongInfo.bar_length # length plus some padding
	current_position = Vector2(0, -SongInfo.bar_length)
	
func _process(delta):
	bars_node.position += Vector2(0, scroll_speed) * delta

	for bar in bars:
		if bar.position.y + bars_node.position.y >= bar_despawn_point:
			despawn_bar(bar)
			spawn_bar()

func set_scroll_speed(rate):
	scroll_speed = rate

func initial_bar_spawn():
	for i in range(4):
		spawn_bar()

func spawn_bar():
	var bar = bar_scene.instance()
	bar.position = Vector2(0, current_position.y)
	bars.append(bar)
	bars_node.add_child(bar)
	current_position += Vector2(0, -SongInfo.bar_length)

func despawn_bar(bar):
	bar.queue_free()
	bars.erase(bar)

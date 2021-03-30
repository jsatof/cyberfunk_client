extends Control

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_tree().change_scene("res://scenes/SongSelection.tscn") != OK:
			print("Change scene to SongSelection error")

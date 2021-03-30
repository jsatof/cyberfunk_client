extends Control

func move_to_song_selection():
	var result = get_tree().change_scene("res://SongSelection.tscn")
	assert(result == OK)

func _on_AvatarRect_gui_input(event):
	if event is InputEventMouseButton:
		move_to_song_selection()
		
	if event is InputEventKey:
		if event.pressed == KEY_ENTER or event.pressed == KEY_SPACE:
			move_to_song_selection()

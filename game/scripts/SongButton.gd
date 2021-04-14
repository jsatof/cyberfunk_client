extends TextureButton

var Song_toggle_mode = false

func set_toggle_mode(press):
	Song_toggle_mode = press

func get_toggle_mode():
	return Song_toggle_mode

func _on_SongButton_toggled(button_pressed):
	set_toggle_mode(true)


func _on_SongButton_pressed():
	get_tree().change_scene("res://scenes/Gameplay.tscn")

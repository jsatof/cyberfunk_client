extends TextureButton

func _on_GoButton_pressed():
	if get_node("../SongButton").get_toggle_mode()==true:
		get_tree().change_scene("res://scenes/Gameplay.tscn")

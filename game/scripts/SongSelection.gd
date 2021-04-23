extends Control

func _on_Button_pressed():
	if get_tree().change_scene("res://scenes/Gameplay.tscn") != OK:
		print("Change scene to Gameplay.tscn error")

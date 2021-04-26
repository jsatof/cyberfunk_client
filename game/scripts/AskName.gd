extends Control

func _on_Button_pressed():
	Stats.username = $ColorRect/TextEdit.text
	get_tree().change_scene("res://scenes/EndScreen.tscn")

func _on_LineEdit_text_entered(new_text):
	Stats.username = $ColorRect/LineEdit.text
	get_tree().change_scene("res://scenes/EndScreen.tscn")

func _on_LineEdit_text_changed(new_text):
	if new_text.length() > 0:
		$ColorRect/Button.disabled = false

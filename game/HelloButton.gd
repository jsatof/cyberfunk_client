extends Control

# load the Simple library
onready var data = preload("res://bin/simple.gdns").new()

func _on_Button_pressed():
	$Label.text = "Data = " + data.get_data()


func _on_Button2_pressed():
	$Label2.text = "Data = " + data.get_data()

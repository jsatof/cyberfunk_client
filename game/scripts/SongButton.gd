extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Song_toggle_mode = false

# Called when the node enters the scene tree for the first time.
func set_toggle_mode(press):
	Song_toggle_mode = press

func get_toggle_mode():
	return Song_toggle_mode


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_SongButton_toggled(button_pressed):
	set_toggle_mode(true)

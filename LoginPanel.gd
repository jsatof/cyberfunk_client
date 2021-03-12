extends Control

func _on_ready():
	var front_panel_style = $FrontPanel.get_stylebox("normal")


# The snippet below assumes the child node MyButton has a StyleBoxFlat assigned.
# Resources are shared across instances, so we need to duplicate it
# to avoid modifying the appearance of all other buttons.
#var new_stylebox_normal = $MyButton.get_stylebox("normal").duplicate()
#new_stylebox_normal.border_width_top = 3
#new_stylebox_normal.border_color = Color(0, 1, 0.5)
#$MyButton.add_stylebox_override("normal", new_stylebox_normal)

# Remove the stylebox override:
#$MyButton.add_stylebox_override("normal", null)

func _on_FrontRect_mouse_exited():
	pass

func _on_FrontRect_mouse_entered():

	pass

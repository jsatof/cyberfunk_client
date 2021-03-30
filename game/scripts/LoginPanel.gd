extends Control

func _on_FrontRect_gui_input(event):
	var form_node = get_parent().get_node("LoginForm")
	
	if event is InputEventMouseButton:
		form_node.visible = true
		get_parent().get_node("PressStart").visible = false
		get_parent().get_node("Title").visible = false

# TODO: Something with changing color to look clickable
func _on_FrontRect_mouse_exited():
	pass

func _on_FrontRect_mouse_entered():
	pass


# STUB: On login success, hide login form, and update text with profile name and avatar

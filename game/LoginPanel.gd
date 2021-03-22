extends Control

func _on_FrontRect_gui_input(event):
	var form_node = get_parent().get_parent().get_node("LoginForm")
	if event is InputEventMouseButton:
		form_node.visible = true 
		
		

# TODO: Something with changing color to look clickable
func _on_FrontRect_mouse_exited():
	pass

func _on_FrontRect_mouse_entered():
	pass


# STUB: On login success, hide login form, and update text with profile name and avatar


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	pass # Replace with function body.

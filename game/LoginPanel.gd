extends Control

func _on_FrontRect_gui_input(event):
	if event is InputEventMouseButton:
		var root_node = get_parent().get_parent()
		root_node.get_node("LoginForm").visible = true

# TODO: Something with changing color to look clickable
func _on_FrontRect_mouse_exited():
	pass

func _on_FrontRect_mouse_entered():
	pass





func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	pass # Replace with function body.

extends Control

func _on_LoginForm_ready():
	self.visible = false
	
# STUB - escape key input not detected
func _on_LoginForm_gui_input(event):
	if self.visible:
		if event is InputEventKey:
			if event.pressed == KEY_ESCAPE:
				self.visible = false

func _on_LoginButton_pressed():
	var username = $UsernameField.text
	var password = $PasswordField.text	
	var pass_hash = hash(password)
	
	# STUB: Check for invalid input
	
	var path = ""
	
	if not username == null:
		if not password == null:
			path = "http://localhost:5000/api/login/?username={name_input}&password={pass_input}".format({"name_input": username, "pass_input": pass_hash})
			
			
	if not path == "":
		$HTTPRequest.request(path, [], false, HTTPClient.METHOD_POST, "")
	
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print("json result: {res}".format({"res": json.result}))
	
	$UsernameField.text = ""
	$PasswordField.text = ""




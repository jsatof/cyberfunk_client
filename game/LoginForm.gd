extends Control

func _on_LoginButton_pressed():
	var path = "http://localhost:5000/post"
	var ssl = false
	
	var username = $UsernameField.text
	var password = $PasswordField.text	
	var pass_hash = hash(password)
	
	var send_data = "{'username': {u}, 'password': {p}}".format({'u': username, 'p': pass_hash})

	_make_post_request(path, send_data, ssl)
	

func _make_post_request(url, data_to_send, use_ssl):
	var query = JSON.print(data_to_send)
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, use_ssl, HTTPClient.METHOD_POST, query)
	
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print("json result: {res}".format({"res": json.result}))
	
	$UsernameField.text = ""
	$PasswordField.text = ""	


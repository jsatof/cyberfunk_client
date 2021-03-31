extends Node2D

func _input(event):
	if Input.is_action_pressed("d_key"):
		$NoteButtonD.frame = 1
	
	elif Input.is_action_pressed("f_key"):
		$NoteButtonF.frame = 1
		
	elif Input.is_action_pressed("j_key"):
		$NoteButtonJ.frame = 1
		
	elif Input.is_action_pressed("k_key"):
		$NoteButtonK.frame = 1
		
	if Input.is_action_just_released("d_key"):
		$NoteButtonD.frame = 0
	
	elif Input.is_action_just_released("f_key"):
		$NoteButtonF.frame = 0

	elif Input.is_action_just_released("j_key"):
		$NoteButtonJ.frame = 0
		
	elif Input.is_action_just_released("k_key"):
		$NoteButtonK.frame = 0

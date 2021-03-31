extends AnimatedSprite

var perfect = false
var good = false
var great = false
var current_note = null

export var input = ""


func _unhandled_input(event):
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			if current_note != null:
				if perfect:
					get_parent().increment_score(100)
					current_note.destroy(3)
				elif great:
					get_parent().increment_score(50)
					current_note.destroy(2)
				elif good:
					get_parent().increment_score(25)
					current_note.destroy(1)
				_reset()
			else:
				get_parent().increment_score(0)
		if event.is_action_pressed(input):
			frame = 1
		elif event.is_action_released(input):
			$PushTimer.start()


func _on_PerfectArea_area_entered(area):
	if area.is_in_group("note_group"):
		perfect = true


func _on_PerfectArea_area_exited(area):
	if area.is_in_group("note_group"):
		perfect = false


func _on_GoodArea_area_entered(area):
	if area.is_in_group("note_group"):
		good = true


func _on_GoodArea_area_exited(area):
	if area.is_in_group("note_group"):
		good = false


func _on_GreatArea_area_entered(area):
	if area.is_in_group("note_group"):
		great = true
		current_note = area


func _on_GreatArea_area_exited(area):
	if area.is_in_group("note_group"):
		great = false
		current_note = null


func _on_PushTimer_timeout():
	frame = 0


func _reset():
	current_note = null
	perfect = false
	good = false
	great = false

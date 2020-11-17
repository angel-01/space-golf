extends FlagInterface

var points: int = 0
		

func _on_Far_body_entered(body):
	if body.is_in_group('balls'):
		print('entre en "lejos"')
		points += 1
		active = true
		counting = true
		current_body = body


func _on_Far_body_exited(body):
	if body.is_in_group('balls'):
		print('sali de "lejos"')
		points -= 1
		active = false
		counting = false
		current_body = null
		time_inside = 0

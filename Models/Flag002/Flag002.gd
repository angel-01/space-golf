extends FlagInterface


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var points: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Far_body_entered(body):
	if body.is_in_group('balls'):
		print('entre en "lejos"')
		points += 1
		active = true


func _on_Far_body_exited(body):
	if body.is_in_group('balls'):
		print('sali de "lejos"')
		points -= 1
		active = false

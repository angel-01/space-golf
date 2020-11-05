extends Node2D


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


func _on_Close_body_entered(body:Node):
	if body.is_in_group('ball'):
		print('entre en "cerca"')
		points += 1


func _on_Close_body_exited(body):
	if body.is_in_group('ball'):
		print('sali de "cerca"')
		points -= 1


func _on_Middle_body_entered(body):
	if body.is_in_group('ball'):
		print('entre en "medio"')
		points += 1


func _on_Middle_body_exited(body):
	if body.is_in_group('ball'):
		print('sali de "medio"')
		points -= 1


func _on_Far_body_entered(body):
	if body.is_in_group('ball'):
		print('entre en "lejos"')
		points += 1


func _on_Far_body_exited(body):
	if body.is_in_group('ball'):
		print('sali de "lejos"')
		points -= 1

extends Node

var current_level = 0
var levels = [
	{
		'path': "res://Levels/Level1.tscn"
	},
	{
		'path': "res://Levels/Level2.tscn"
	},
]

func _ready():
	pass # Replace with function body.
	
func start_level():
	if current_level < len(levels):
		get_tree().change_scene(levels[current_level]['path'])
		current_level += 1

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit(0)

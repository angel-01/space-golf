extends Node

# TODO:
# hacer objetos para colissionar
# limpiar imagenes no usadas
# convertir los controles a pixel art
# probar controles de zoom en android
# el boton de opciones no funciona en android

var current_level = 0
var levels = [
	{
		'path': "res://Levels/Level1.tscn",
		'image': "res://Art/Level1Image.png"
	},
	{
		'path': "res://Levels/Level2.tscn",
		'image': "res://Art/Level2Image.png"
	},
	{
		'path': "res://Levels/Level3.tscn",
		'image': "res://Art/Level3Image.png"
	},
	{
		'path': "res://Levels/Level4.tscn",
		'image': "res://Art/Level4Image.png"
	},
	{
		'path': "res://Levels/Level5.tscn",
		'image': "res://Art/Level5Image.png"
	},
	{
		'path': "res://Levels/Level6.tscn",
		'image': "res://Art/Level6Image.png"
	},
	{
		'path': "res://Levels/Level7.tscn",
		'image': "res://Art/Level7Image.png"
	},
	{
		'path': "res://Levels/Level8.tscn",
		'image': "res://Art/Level8Image.png"
	},
]

var on_win_screen = false

func _ready():
	pass # Replace with function body.
	
func start_level():
	if current_level < len(levels):
		get_tree().change_scene(levels[current_level]['path'])
		current_level += 1

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit(0)

extends Node

# TODO:
# completar la grieta. hacer que si la bola la toca se reinicie el level. que si otra cosa la toca, lo desbarate. que tenga gravedad fuerte a su centro
# buscar mas imagenes de fondo
# hacer objetos para colissionar
# hacerle un icono al juego (por alguna razon se ve bien en desktop pero no en android)
# planetas con huecos pasables???

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

extends Node

# TODO:
# nivel multi bandera. hay que ganarlas todas y se ira moviendo el punto de partida a la ultima ganada
# planetas con huecos pasables???
# adicionar a la pantalla de victoria los botones de siguiente y de resetear
# adicionar selector de nivel
# adicionar menu para salir o reiniciar durante la partida

var current_level = 0
var levels = [
	{
		'path': "res://Levels/Level1.tscn"
	},
	{
		'path': "res://Levels/Level2.tscn"
	},
	{
		'path': "res://Levels/Level3.tscn"
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

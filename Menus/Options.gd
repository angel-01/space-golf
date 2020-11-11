extends Control


signal main_menu
signal restart


# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	$Background.hide()
	$Menu.hide()
	$OptionsButton.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OptionsButton_pressed():
	$Background.show()
	$Menu.show()
	$OptionsButton.hide()


func _on_Exit_pressed():
	get_tree().quit(0)


func _on_MainMenu_pressed():
	get_tree().change_scene("res://Menus/Main.tscn")


func _on_Restart_pressed():
	get_tree().reload_current_scene()

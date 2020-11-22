extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var show = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.get_name() != 'Android':
		show = false
	else:
		show = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if not GameManager.on_win_screen and show:
		show()
	else:
		hide()

func _on_RotateLeft_button_down():
	Input.action_press("ui_up")


func _on_RotateLeft_button_up():
	Input.action_release("ui_up")


func _on_RotateRight_button_down():
	Input.action_press("ui_down")


func _on_RotateRight_button_up():
	Input.action_release("ui_down")


func _on_DecreaseForce_button_down():
	Input.action_press("ui_left")


func _on_DecreaseForce_button_up():
	Input.action_release("ui_left")


func _on_IncreaseForce_button_down():
	Input.action_press("ui_right")


func _on_IncreaseForce_button_up():
	Input.action_release("ui_right")

func _on_Restart_pressed():
	var action = InputEventAction.new()
	action.pressed = true
	action.action = 'reset'
	Input.parse_input_event(action)
	action.pressed = false
	action.action = 'reset'
	Input.parse_input_event(action)


func _on_Hit_pressed():
	var action = InputEventAction.new()
	action.pressed = true
	action.action = 'hit'
	Input.parse_input_event(action)
	action.pressed = false
	action.action = 'hit'
	Input.parse_input_event(action)


func _on_ZoomIn_pressed():
	get_tree().current_scene.camera_zoom_level -= 1
	get_tree().current_scene.camera_zoom_level = clamp(get_tree().current_scene.camera_zoom_level, 1, get_tree().current_scene.CAMERA_MAX_ZOOM_LEVEL)
	get_tree().current_scene.camera.zoom = get_tree().current_scene.camera_initial_zoom * get_tree().current_scene.camera_zoom_level


func _on_ZoomOut_pressed():
	get_tree().current_scene.camera_zoom_level += 1
	get_tree().current_scene.camera_zoom_level = clamp(get_tree().current_scene.camera_zoom_level, 1, get_tree().current_scene.CAMERA_MAX_ZOOM_LEVEL)
	get_tree().current_scene.camera.zoom = get_tree().current_scene.camera_initial_zoom * get_tree().current_scene.camera_zoom_level


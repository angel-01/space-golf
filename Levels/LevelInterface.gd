extends Node2D
class_name LevelInterface

export(NodePath) var start_point_path
export(NodePath) var indicator_path
export(NodePath) var camera_path

var flags
var ball: RigidBody2D
var start_point: Position2D
var indicator: Node2D
var camera: Camera2D
var camera_initial_position: Vector2
var camera_target: Vector2
var hitted: bool = false
var should_reset: bool = false
var win_screen
var following_ball = false

var _mouse_captured = false
var camera_rectangle: Rect2
var camera_zoom_level = 1
var CAMERA_MAX_ZOOM_LEVEL = 3
var camera_initial_zoom: Vector2

func _ready():
	win_screen = find_node('WinScreen')
	win_screen.connect("restart", self, "restart")
	win_screen.connect("next_level", GameManager, "start_level")
	GameManager.on_win_screen = false
	flags = get_tree().get_nodes_in_group('flags')
#	ball = get_node(ball_path)
	ball = get_tree().get_nodes_in_group('balls')[0]
	start_point = get_node(start_point_path)
	indicator = get_node(indicator_path)
	camera = get_node(camera_path)
	
	camera_initial_zoom = camera.zoom
	
	indicator.connect('hit', self, "on_hit")
	ball.connect('sleeping_state_changed', self, 'on_sleeping_state_changed')
	camera_initial_position = camera.position
	camera_target = camera_initial_position
	
	for i in flags:
		i.connect("time_inside_completed", self, 'check')
#	indicator.connect('hit', self, "on_hit")
#	ball.connect('sleeping_state_changed', self, 'check')

func on_hit():
	hitted = true
	following_ball = true

func _process(delta):
	pass
#	if hitted:
#		camera.position = ball.position

func _physics_process(delta):
	if camera_target:
		camera.position = (camera_target - camera.position) * 0.1 + camera.position
	if following_ball:
		camera_target = ball.position
		

func _unhandled_input(event):
	
	if typeof(event) == typeof(InputEventScreenTouch):
		pass
	
	if event.is_action_pressed("mouse_click"):
		_mouse_captured = true
	if event.is_action_released("mouse_click"):
		_mouse_captured = false
		
	if event is InputEventMouseButton:
		event as InputEventMouseButton
		if event.pressed:
			match event.button_index:
				BUTTON_WHEEL_UP:
					camera_zoom_level -= 1
				BUTTON_WHEEL_DOWN:
					camera_zoom_level += 1
			
			camera_zoom_level = clamp(camera_zoom_level, 1, CAMERA_MAX_ZOOM_LEVEL)
			camera.zoom = camera_initial_zoom * camera_zoom_level
		
	if _mouse_captured && event is InputEventMouseMotion or event is InputEventScreenDrag:
		if  camera_rectangle.has_point(camera_target - event.relative):
#			if not hitted:
			following_ball = false
			camera_target -= event.relative
	
	if not GameManager.on_win_screen:
		if Input.is_action_just_pressed("reset"):
			reset()
		
func reset():
	camera_target = camera_initial_position
	ball.move(start_point.position)
	indicator.show()
	indicator.enabled = true
	should_reset = false
	hitted = false
	following_ball = false
	
func restart():
	get_tree().reload_current_scene()

func on_sleeping_state_changed():
	if ball.sleeping:
		check()

func check():
#	if hitted and ball.sleeping:
	if hitted:
		var winner = false
		
		for i in flags:
			if i.active:
				if i.is_in_group('winner_flags'):
					GameManager.on_win_screen = true
					indicator.enabled = false
					should_reset = false
					hitted = false
					win_screen.show()
					win_screen.stars_to_show = i.points
					return
				else:
					start_point.position = ball.position
					camera_initial_position = ball.position
		
		reset()

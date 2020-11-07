extends Node2D
class_name LevelInterface

export(NodePath) var flag_path
export(NodePath) var ball_path
export(NodePath) var start_point_path
export(NodePath) var indicator_path
export(NodePath) var camera_path

var flag: Node2D
var ball: RigidBody2D
var start_point: Position2D
var indicator: Node2D
var camera: Camera2D
var camera_initial_position: Vector2
var camera_target: Vector2
var hitted: bool = false
var should_reset: bool = false
var win_screen

var _mouse_captured = false
var camera_rectangle: Rect2

func _ready():
	win_screen = find_node('WinScreen')
	win_screen.connect("restart", self, "restart")
	win_screen.connect("next_level", GameManager, "start_level")
	GameManager.on_win_screen = false
	flag = get_node(flag_path)
	ball = get_node(ball_path)
	start_point = get_node(start_point_path)
	indicator = get_node(indicator_path)
	camera = get_node(camera_path)
	
	indicator.connect('hit', self, "on_hit")
	ball.connect('sleeping_state_changed', self, 'ball_sleeping_state_changed')
	camera_initial_position = camera.position
	camera_target = camera_initial_position
	
	indicator.connect('hit', self, "on_hit")
	ball.connect('sleeping_state_changed', self, 'ball_sleeping_state_changed')

func on_hit():
	hitted = true

func _process(delta):
	pass
#	if hitted:
#		camera.position = ball.position

func _physics_process(delta):
	if camera_target:
		camera.position = (camera_target - camera.position) * 0.1 + camera.position
	if hitted:
		camera_target = ball.position
		

func _unhandled_input(event):
	
	if typeof(event) == typeof(InputEventScreenTouch):
		pass
	
	if event.is_action_pressed("mouse_click"):
		_mouse_captured = true
	if event.is_action_released("mouse_click"):
		_mouse_captured = false
		
	if _mouse_captured && event is InputEventMouseMotion or event is InputEventScreenDrag:
		if  camera_rectangle.has_point(camera_target - event.relative):
			if not hitted:
				camera_target -= event.relative
	
	if not GameManager.on_win_screen:
		if Input.is_action_just_pressed("reset"):
			reset()
		
func reset():
#	camera.position = camera_initial_position
	camera_target = camera_initial_position
	ball.move(start_point.position)
	indicator.show()
	indicator.enabled = true
	should_reset = false
	hitted = false
	
func restart():
	get_tree().reload_current_scene()

func ball_sleeping_state_changed():
	if hitted and ball.sleeping:
#		centered_camera.make_current()
		if flag.points == 0:
			reset()
		else:
			GameManager.on_win_screen = true
			indicator.enabled = false
			should_reset = false
			hitted = false
			win_screen.show()
			win_screen.stars_to_show = flag.points
#			get_tree().create_timer(5).connect("timeout", GameManager, "start_level")

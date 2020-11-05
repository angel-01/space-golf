extends Node2D

export(NodePath) var flag_path
export(NodePath) var ball_path
export(NodePath) var start_point_path
export(NodePath) var indicator_path

var flag: Node2D
var ball: RigidBody2D
var start_point: Position2D
var indicator: Node2D

var hitted: bool = false
var should_reset: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	flag = get_node(flag_path)
	ball = get_node(ball_path)
	start_point = get_node(start_point_path)
	indicator = get_node(indicator_path)
	
	indicator.connect('hit', self, "on_hit")
	ball.connect('sleeping_state_changed', self, 'ball_sleeping_state_changed')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func on_hit():
	hitted = true
	
func ball_sleeping_state_changed():
	if hitted and ball.sleeping:
		should_reset = false
		hitted = false
		if flag.points == 0:
#			ball.position = start_point.position
			ball.move(start_point.position)
			indicator.show()
			indicator.enabled = true
		else:
			var centered_camera: Camera2D = find_node('CenteredCamera')
			var win_screen = find_node('WinScreen')
			centered_camera.make_current()
			win_screen.show()
			win_screen.stars_to_show = flag.points

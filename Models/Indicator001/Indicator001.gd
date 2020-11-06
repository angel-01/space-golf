extends Node2D

export(NodePath) var ball_path

signal hit

var RADS_PER_SECOND = 0.01745 * 50  # 0.01745 ~ 1 deg
var FORCE_PER_SECOND = 50
var MAX_FORCE = 200
var force = MAX_FORCE / 2
var ball: RigidBody2D
var initial_scale: Vector2
var enabled = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	ball = get_node(ball_path)
	initial_scale = scale
	scale = initial_scale * force / MAX_FORCE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = ball.position
	
	if Input.is_action_pressed("ui_down"):
		rotate(RADS_PER_SECOND * delta)
	
	if Input.is_action_pressed("ui_up"):
		rotate(-RADS_PER_SECOND * delta)
	
	if Input.is_action_pressed("ui_left"):
		force -= FORCE_PER_SECOND * delta
		force = clamp(force, 0, MAX_FORCE)
		scale = initial_scale * force / MAX_FORCE
	
	if Input.is_action_pressed("ui_right"):
		force += FORCE_PER_SECOND * delta
		force = clamp(force, 0, MAX_FORCE)
		scale = initial_scale * force / MAX_FORCE

func _input(event):
	if Input.is_action_just_pressed("hit") and enabled:
		emit_signal("hit")
		hide()
		enabled = false
		if not ball_path:
			print('Error. ball_path must be defined')
			return
		 
		ball.apply_impulse(Vector2.ZERO, Vector2.UP.rotated(rotation) * force)
#		.apply_impulse(Vector2.ZERO, x.normalized() * gun.damage)

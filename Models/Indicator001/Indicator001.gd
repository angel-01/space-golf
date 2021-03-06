extends Node2D

export(NodePath) var ball_path
export(int) var MAX_FORCE = 200

signal hit

var RADS_PER_SECOND = 0.01745 * 50  # 0.01745 ~ 1 deg
var FORCE_PER_SECOND = 50
var force = MAX_FORCE / 2
var ball: RigidBody2D
var initial_scale: Vector2
var enabled = true
var ghost_ball_interval = 1
var ghost_ball_interval_counter = 0.0
var is_ghost_ball_active = false
var ghost_ball = preload("res://Models/GhostGolfBall001/GhostGolfBall001.tscn")
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
	
	if Input.is_action_just_pressed("ghost_ball"):
		is_ghost_ball_active = !is_ghost_ball_active
		
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
		
	if is_ghost_ball_active:
		ghost_ball_interval_counter += delta
		if ghost_ball_interval_counter >= ghost_ball_interval and enabled:
			ghost_ball_interval_counter = 0
			var new_ball: RigidBody2D = ghost_ball.instance()
			new_ball.position = position
			new_ball.max_life_time = 30
			get_tree().current_scene.add_child(new_ball)
			new_ball.apply_impulse(Vector2.ZERO, Vector2.UP.rotated(rotation) * force)
			

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

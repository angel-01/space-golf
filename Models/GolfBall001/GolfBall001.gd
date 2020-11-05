extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pending_move: bool = false
var pending_move_vector: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func move(to: Vector2):
	pending_move = true
	pending_move_vector = to
	
func _integrate_forces(state):
	if pending_move:
		state.transform = Transform2D(0, pending_move_vector)
		state.linear_velocity = Vector2.ZERO
		pending_move = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

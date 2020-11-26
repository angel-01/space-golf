extends RigidBody2D
class_name BallInterface

var pending_move_with_velocity: bool = false
var pending_move_vector_with_velocity: Vector2 = Vector2.ZERO

func move_with_velocity(to: Vector2):
	pending_move_with_velocity = true
	pending_move_vector_with_velocity = to
	
func _integrate_forces(state):
	if pending_move_with_velocity:
		state.transform = Transform2D(0, pending_move_vector_with_velocity)
		pending_move_with_velocity = false

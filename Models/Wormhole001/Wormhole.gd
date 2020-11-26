extends Node2D

export(NodePath) var exit_wormhole_path

var exit_wormhole: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	exit_wormhole = get_node(exit_wormhole_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Singularity_body_entered(body):
	
	if body.has_method('move_with_velocity'):
		body as BallInterface
		body.move_with_velocity(exit_wormhole.position)

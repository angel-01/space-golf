extends Node2D


export(float) var linear_damp = -1
export(float) var linear_rotation = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.linear_damp = linear_damp

func _physics_process(delta):
	if linear_rotation:
		rotate(linear_rotation)

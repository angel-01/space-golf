extends Node2D
class_name PlanetInterface

export(float) var linear_rotation = 0
export(float) var gravity = 98

func _ready():
	$StaticBody2D.constant_angular_velocity = rad2deg(linear_rotation)
	$Area2D.gravity = gravity

func _physics_process(delta):
	if linear_rotation:
		rotate(linear_rotation)

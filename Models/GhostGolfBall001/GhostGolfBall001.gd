extends RigidBody2D

export(int) var max_life_time = 10

func _ready():
	get_tree().create_timer(max_life_time).connect("timeout", self, "queue_free")
	

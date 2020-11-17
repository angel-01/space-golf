extends Node2D
class_name FlagInterface

signal time_inside_completed

export(int) var MAX_TIME_TO_SIGNAL = 5
export(float) var MAX_DISTANCE_DIFFERENCE_TO_START_COUNTING = 1

var active = false
var current_body: Node2D = null
var time_inside = 0.0
var counting = false

func _physics_process(delta):
	if counting:
		time_inside += delta
		print(time_inside)
		if time_inside >= MAX_TIME_TO_SIGNAL:
			counting = false
			current_body.stop()
			print('time_inside_completed')
			emit_signal("time_inside_completed")

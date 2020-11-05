extends CenterContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var stars_to_show: int = 0 setget set_stars_to_show

func set_stars_to_show(val):
	var star1 = find_node('Star1')
	var star2 = find_node('Star2')
	var star3 = find_node('Star3')
	
	star1.hide()
	star2.hide()
	star3.hide()
	
	if val > 0:
		star1.show()
	if val > 1:
		star2.show()
	if val > 2:
		star3.show()
		
	stars_to_show = val
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

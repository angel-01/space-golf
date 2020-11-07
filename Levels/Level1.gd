extends LevelInterface

func _ready():
	camera_rectangle = Rect2(Vector2(0, 0), Vector2(1024, 600))
	if OS.get_name() == 'Android':
		$Tutorial.hide()
	else:
		$Tutorial.show()

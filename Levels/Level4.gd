extends LevelInterface

func _ready():
	camera_rectangle = Rect2(Vector2(0, -200), Vector2(2048, 800))
	
func _on_Area2D_body_exited(body: Node2D):
	if body.is_in_group('balls'):
		reset()

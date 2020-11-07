extends LevelInterface

func _ready():
	camera_rectangle = Rect2(Vector2(0, 0), Vector2(1024, 600))
	
func _on_Area2D_body_exited(body):
	reset()

extends LevelInterface

func _ready():
	camera_rectangle = Rect2(Vector2(412, 100), Vector2(612, 400))
	
func _on_Area2D_body_exited(body):
	reset()

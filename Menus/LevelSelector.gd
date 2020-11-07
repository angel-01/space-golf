extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var grid = find_node('ButtonGrid')
	var template = find_node('TemplateButton')
	var index = 0
	for x in GameManager.levels:
		var new_button: TextureButton = template.duplicate()
		new_button.show()
		new_button.texture_normal = load(x['image'])
		new_button.connect("pressed", self, 'start_level', [index])
		grid.add_child(new_button)
		index += 1

func start_level(index):
	GameManager.current_level = index
	GameManager.start_level()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

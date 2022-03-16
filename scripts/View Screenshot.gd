extends Panel
onready var s = $Sprite
var list = []
var num = -1
func _ready() -> void:
	var paths = Global.list_files_in_directory("user://screenshot")
	for things in paths:
		num += 1
		var true_path = "user://screenshot/" + things
		list.append(true_path)
	var img = Image.new()
	img.load(list[num])
	var v = ImageTexture.new()
	v.create_from_image(img)
	s.texture = v

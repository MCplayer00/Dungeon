extends Label
var screenshot_folder = "user://screenshot/"
onready var screenshot_node = [$"ItemList/Control/No Screenshot",$"ItemList/Control2/No Screenshot2",$"ItemList/Control3/No Screenshot3",$"ItemList/Control4/No Screenshot4"
	,$"ItemList/Control5/No Screenshot5",$"ItemList/Control6/No Screenshot6"]
var have_screenshot_path = []
func _ready() -> void:
	have_screenshot_path.append_array(Global.list_files_in_directory(screenshot_folder))
	var the_num = -1
	for shots in have_screenshot_path:
		the_num += 1
		var true_path = screenshot_folder + have_screenshot_path[the_num]
		var image = Image.new()
		image.load(true_path)
		var tex = ImageTexture.new()
		tex.create_from_image(image)
		screenshot_node[the_num].texture = tex

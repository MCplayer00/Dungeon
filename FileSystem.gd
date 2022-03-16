extends Node
const screenshot_folder = "user://screenshot/"
var screenshot_filepath = ["user://screenshot/screenshot_1.png","user://screenshot/screenshot_2.png"
	,"user://screenshot/screenshot_3.png","user://screenshot/screenshot_4.png"
	,"user://screenshot/screenshot_5.png","user://screenshot/screenshot_6.png"]

func _ready() -> void:
	var dic = Directory.new()
	if not dic.open(screenshot_folder) == OK:
		dic.make_dir(screenshot_folder)
		
func make_screenshot():
	var screenshot = get_viewport().get_texture().get_data()
	screenshot.resize(1280,720)
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	screenshot.flip_y()
	var f = File.new()
	for screenshots in screenshot_filepath:
		if not f.file_exists(screenshots):
			screenshot.save_png(screenshots)
			break
		if screenshots == "user://screenshot/screenshot_6.png":
			return "end"

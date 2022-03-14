extends Node
var rng = RandomNumberGenerator.new()
const screenshot_path = "user://screenshot.png"
var level_seed: int
var score =  "00000"
var time: String
func _ready() -> void:
	rng.randomize()
func get_random_number(from,to):
	return(rng.randi_range(from,to))


func screenshot():
	var screenshot = get_viewport().get_texture().get_data()
	screenshot.flip_y()
	screenshot.save_png(screenshot_path)

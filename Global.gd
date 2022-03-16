extends Node
var rng = RandomNumberGenerator.new()
const screenshot_path = "user://screenshot/"
var level_seed: int
var score =  "00000"
var time: String
var settings = {"Volume":""}
func _ready() -> void:
	rng.randomize()
func get_random_number(from,to):
	return(rng.randi_range(from,to))
	
func add_point(point_add):
	var ipoint = int(int(score)+point_add)
	if ipoint <10:
		score = "0000" + str(ipoint)
	elif ipoint <100 and ipoint >= 10:
		score = "000" + str(ipoint)
	elif ipoint < 1000 and ipoint >= 100:
		score = "00" + str(ipoint)
	elif ipoint < 10000 and ipoint >= 1000:
		score = "0" + str(ipoint)
	else:
		score = str(ipoint)

func save_settings():
	pass

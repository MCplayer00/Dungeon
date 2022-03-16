extends Node
var rng = RandomNumberGenerator.new()
const screenshot_path = "user://screenshot/"
const data = "user://data.dat"
var level_seed: int
var score =  "00000"
var best = ""
var best_time = ""
var time: String
var settings = {"Volume":100}
func _ready() -> void:
	var best = load_best()
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
func write_best(best_score):
	var f = File.new()
	f.open(data,File.WRITE)
	f.store_var(best_score)
	f.close()
func load_best():
	var f = File.new()
	if f.file_exists(data):
		f.open(data,File.READ)
		var data = f.get_var()
		f.close()
		return data
	else:
		write_best("000000")
func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()
	return files

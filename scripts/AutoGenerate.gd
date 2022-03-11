extends Node2D
var rng = RandomNumberGenerator.new()
var last_pos = Vector2(935.5,273.5)
var levels = [preload("res://scenes/auto generates/Flat.tscn"),preload("res://scenes/auto generates/gap.tscn")]
func _ready() -> void:
	for thing in range(-1,6,-1):
		print(thing)
	if Global.level_seed != 0:
		rng.seed = Global.level_seed
	else:
		rng.randomize()
	generate_level()
	generate_level()
	generate_level()
func generate_level():
	var plate = levels[rng.randi_range(0,1)].instance()
	plate.position = last_pos
	add_child(plate)
	last_pos = plate.get_node("End").global_position
func _on_Timer_timeout() -> void:
	generate_level()

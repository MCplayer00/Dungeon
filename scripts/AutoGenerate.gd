extends Node2D
var rng = RandomNumberGenerator.new()
var last_pos = Vector2(935.5,273.5)
var levels = [preload("res://scenes/auto generates/Flat.tscn"),preload("res://scenes/auto generates/gap.tscn"),
	preload("res://scenes/auto generates/Double Layer.tscn"),preload("res://scenes/auto generates/Gap With Bridge.tscn"),
	preload("res://scenes/auto generates/Gap With Random.tscn")]
func _ready() -> void:
	if Global.level_seed != 0:
		rng.seed = Global.level_seed
	if OS.has_touchscreen_ui_hint():
		$"GUI/MB mode/Jump".show()
	else:
		rng.randomize()
	generate_level()
	generate_level()
	generate_level()
func generate_level():
	var plate = levels[rng.randi_range(0,4)].instance()
	plate.position = last_pos
	add_child(plate)
	last_pos = plate.get_node("End").global_position
func _on_Timer_timeout() -> void:
	generate_level()




func _on_Player_die() -> void:
	var ds = load("res://scenes/Dealth Screen.tscn").instance()
	$GUI.add_child(ds)

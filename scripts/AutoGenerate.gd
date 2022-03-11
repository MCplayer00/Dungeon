extends Node2D
var rng = RandomNumberGenerator.new()
const first_flat = Vector2(942.5,674)
var levels = ["res://scenes/auto generates/Flat.tscn"]
func _ready() -> void:
	if Global.level_seed != 0:
		rng.seed = Global.level_seed
	else:
		rng.randomize()
	generate_level()

func generate_level():
	load(levels[rng.randi_range(0,0)])

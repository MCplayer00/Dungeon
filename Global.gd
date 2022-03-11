extends Node
var rng = RandomNumberGenerator.new()
var level_seed: int = 10000-1230
func _ready() -> void:
	rng.randomize()
func get_random_number(from,to):
	return(rng.randi_range(from,to))

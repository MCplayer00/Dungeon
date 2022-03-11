extends Node
var rng = RandomNumberGenerator.new()
var level_seed: int
func _ready() -> void:
	rng.randomize()
func get_random_number(from,to):
	return(rng.randi_range(from,to))

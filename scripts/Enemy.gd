extends Node2D
var enemys = ["res://scenes/Fire Enemy.tscn"]

func _ready() -> void:
	add_child(load(enemys[Global.get_random_number(0,0)]).instance())

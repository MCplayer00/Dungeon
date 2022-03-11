extends StaticBody2D
var enemy = preload("res://scenes/Enemy.tscn")
signal player_go
func _ready() -> void:
	if Global.get_random_number(0,1) == 1:
		var Enemy_Object = enemy.instance()
		Enemy_Object.position = $Position2D.position
		add_child(Enemy_Object)


func _on_Area2D_body_exited(body: Node) -> void:
	if body.name == "Player":
		emit_signal("player_go")

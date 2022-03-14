extends KinematicBody2D

func _physics_process(delta: float) -> void:
	position.x -= 750 * delta



func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.die()


func _on_Timer_timeout() -> void:
	queue_free()

func take_damage():
	queue_free()

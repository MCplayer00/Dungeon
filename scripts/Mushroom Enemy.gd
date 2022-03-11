extends KinematicBody2D

func _on_Hurtbox_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.die()

func take_damage():
	$AnimationPlayer.play("die")

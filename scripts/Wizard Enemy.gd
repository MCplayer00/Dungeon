extends KinematicBody2D
var vec = Vector2.ZERO
onready var bullet = preload("res://scenes/Bullet.tscn")
var need_speed = true
func _process(_delta: float) -> void:
	if need_speed:
		vec.x = -100
	vec = move_and_slide(vec)
func take_damage():
	$CollisionShape2D.call_deferred("queue_free")
	$Area2D.call_deferred("queue_free")
	$AnimationPlayer.play("Hurt")

func _on_Timer_timeout() -> void:
	vec.x = 0
	$AnimatedSprite.play("Magic")
	need_speed = false
	yield($AnimatedSprite,"animation_finished")
	$AnimatedSprite.animation = "Fly"
	var B = bullet.instance()
	get_parent().add_child(B)
	B.global_position = $Position2D.global_position
	vec.x = -100
	need_speed = true


func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.die()

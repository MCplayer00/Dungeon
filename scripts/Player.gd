extends KinematicBody2D

export var speed = 400
export var jump = 400
onready  var gravity = ProjectSettings.get_setting("application/config/gravity")
var vec = Vector2()
func _ready() -> void:
	$AnimatedSprite.play("running")
	jump *= -1
func _input(_event: InputEvent) -> void:
	#Player Jump
	if Input.is_action_just_pressed("jump"):
			if is_on_floor():
				$AnimatedSprite.play("jumping")
				vec.y = jump
				yield($AnimatedSprite,"animation_finished")
				$AnimatedSprite.play("running")
	elif Input.is_action_just_released("use_weapon"):
		if $AnimatedSprite.animation == "running":
			speed = 0
			var anim_name = "sword_" + str(Global.get_random_number(1,3))
			$Swordbox/CollisionShape2D.disabled = false
			$AnimatedSprite.play(anim_name)
			yield($AnimatedSprite,"animation_finished")
			$AnimatedSprite.play("running")
			$Swordbox/CollisionShape2D.disabled = true
			speed = 400
func _physics_process(delta: float) -> void:
	vec.y += gravity * delta
	vec.x = speed
	vec = move_and_slide(vec, Vector2.UP)
	vec.y = min(vec.y,500)
func _on_Swordbox_body_entered(body: Node) -> void:
	if body.name != "Player" and body.name != "StaticBody2D":
		body.take_damage()
		
func die():
	if $AnimatedSprite.animation.begin_with
	$AnimatedSprite.play("dying")
	speed = 0
	yield($AnimatedSprite,"animation_finished")
	$AnimatedSprite.stop()
	get_tree().quit()

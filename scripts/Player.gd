extends KinematicBody2D

export var speed = 400
export var jump = 500
var has_die = false
onready  var gravity = ProjectSettings.get_setting("application/config/gravity")
signal die

var vec = Vector2()
func _ready() -> void:
	$AnimatedSprite.play("running")
	jump *= -1
	
func _input(_event: InputEvent) -> void:
	#Player Jump
	if Input.is_action_just_pressed("screenshot"):
		FileSystem.make_screenshot()
	if Input.is_action_just_pressed("jump") or _event.as_text() == "Space":
			if is_on_floor() and $AnimatedSprite.animation != "dying":
				$AnimatedSprite.play("jumping")
				$Swordbox/CollisionShape2D.disabled = true
				vec.y = jump
				yield($AnimatedSprite,"animation_finished")
				$AnimatedSprite.play("running")
	elif Input.is_action_just_released("use_weapon"):
		if $AnimatedSprite.animation == "running" or $AnimatedSprite.animation == "jumping":
			var anim_name = "sword_" + str(Global.get_random_number(1,3))
			$Swordbox/CollisionShape2D.disabled = false
			$AnimatedSprite.play(anim_name)
			yield($AnimatedSprite,"animation_finished")
			$AnimatedSprite.play("running")
			$Swordbox/CollisionShape2D.disabled = true
func _physics_process(delta: float) -> void:
	vec.y += gravity * delta
	vec.x = speed
	vec = move_and_slide(vec, Vector2.UP)
	vec.y = min(vec.y,500)
	if position.y >= 1000:
		die()
func _on_Swordbox_body_entered(body: Node) -> void:
	if "Enemy" in body.name.capitalize() or body.name == "Bullet":
		body.take_damage()
		Global.add_point(Global.get_random_number(3,8))
func die():
	if not $AnimatedSprite.animation.begins_with("sword_") and has_die == false:
		has_die = true
		$AnimatedSprite.play("dying")
		speed = 0
		yield($AnimatedSprite,"animation_finished")
		emit_signal("die")
		$AnimatedSprite.stop()
		
func _on_Speed_Up_timeout() -> void:
	Global.add_point(15)
	$AnimationPlayer.play("speed up")
	speed += 50


func _on_Jump_pressed() -> void:
	simulate_key(32)
	
func simulate_key(which_key):
  var ev = InputEventKey.new()
  ev.scancode = which_key
  get_tree().input_event(ev)

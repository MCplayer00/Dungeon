extends KinematicBody2D
export var speed = 300
onready  var gravity = ProjectSettings.get_setting("application/config/gravity")
var vec = Vector2.ZERO
var need_gravity = true
func _ready() -> void:
	speed *= -1
func _physics_process(delta: float) -> void:
	if need_gravity:
		vec.y += gravity*delta
		vec = move_and_slide(vec,Vector2.UP)
	if is_on_floor() and $"Jump Timer".time_left ==0:
		$"Jump Timer".start()
	vec.x = -150
func _on_Jump_Timer_timeout() -> void:
	vec.x -= 500
	vec.y = -750
	$"Jump Timer".wait_time = Global.get_random_number(1,1.5)
func take_damage():
	need_gravity = false
	$hurtbox/CollisionShape2D.set_deferred("disabled",true)
	$AnimationPlayer.play("die")

func _on_hurtbox_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.die()

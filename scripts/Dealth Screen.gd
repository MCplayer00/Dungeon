extends Node2D
export var Menu: PackedScene

func _ready() -> void:
	print(Global.load_best())
	$"Panel/You Died/your Score".text = "Score: "+Global.score
	if Global.score > Global.load_best():
		Global.write_best(Global.score)
	else:
		$Panel/Best.text = "Best: "+str(Global.load_best())



func _on_Retry_pressed() -> void:
	Global.score = "00000"
	get_tree().reload_current_scene()

func _on_Menu_pressed() -> void:
	Global.score = "00000"
	get_tree().change_scene_to(Menu)

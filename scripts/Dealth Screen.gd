extends Node2D
export var Menu: PackedScene

func _ready() -> void:
	$"Panel/You Died/your Score".text = "Score: "+Global.score




func _on_Retry_pressed() -> void:
	get_tree().reload_current_scene()

func _on_Menu_pressed() -> void:
	get_tree().change_scene_to(Menu)

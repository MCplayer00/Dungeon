extends Node2D
export var PlayButtonScene: PackedScene
export var ScreenshotButtonScene: PackedScene
export var SettingsButtonScene: PackedScene
func _on_Play_Button_pressed() -> void:
	get_tree().change_scene_to(PlayButtonScene)
	
func _on_Screenshot_Button_pressed() -> void:
	get_tree().change_scene_to(ScreenshotButtonScene)
	

func _on_Settings_Button_pressed() -> void:
	get_tree().change_scene_to(SettingsButtonScene)

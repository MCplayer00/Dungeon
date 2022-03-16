extends Panel



func _on_Button_pressed() -> void:
	get_tree().change_scene_to(load("res://scenes/Menu.tscn"))



func _on_HSlider_value_changed(value: float) -> void:
	Global.settings.volume = value
	$Volume/HSlider/Label.text = str(value)


func _on_SpinBox_value_changed(value: float) -> void:
	Global.level_seed = $SEED/SpinBox.value

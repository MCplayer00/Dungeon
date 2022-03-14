extends CanvasLayer
var minute  = 0
var second = 0

func _on_Timer_timeout() -> void:
	second += 1
	$Time.text = _format_time()
	
	
func _format_time():
	var s_min = ""
	var s_sec = ""
	if second == 60:
		second = 0
		minute += 1
	if second < 10:
		s_sec = "0" + str(second)
	else:
		s_sec = str(second)
	if minute < 10:
		s_min = "0" + str(minute)
	else:
		s_min = str(minute)
	return s_min + ":" + s_sec


func _on_Player_die() -> void:
	$Timer.stop()
	$"MB mode/Jump".hide()
	Global.time = $Time.text

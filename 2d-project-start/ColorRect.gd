extends ColorRect

var time: float = 0.0
var mins: int = 0
var sec: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	sec = fmod(time, 60)
	mins = fmod(time, 3600) / 60
	$time.text = "%02d:" % mins
	$time2.text = "%02d" % sec

func stop() -> void:
	set_process(false)
	
func timeformat() -> String:
	return "%02d:%02d" % [mins, sec]
	

extends CanvasLayer


func _ready():
	hide()

func toggle_visibility():
	if is_visible():
		hide()
	else:
		show()

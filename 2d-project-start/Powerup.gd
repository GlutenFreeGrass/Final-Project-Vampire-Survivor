extends Area2D

func _on_body_entered(body):
	print("touched")
	body.max_speed = body.knew_speed
	$duration.start()
	queue_free()

func _on_duration_timeout(body):
	print("speed")
	body.max_speed = 600

	


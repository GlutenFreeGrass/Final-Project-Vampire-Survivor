extends CharacterBody2D


signal health_depleted

var health = 100.0
@export var speed = 600


func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 25.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
	
func _input(event):
	if Input.is_action_pressed("devpanelkey"):
		var canvas_layer = get_node("/root/Game/Player/DevPanel")
		if canvas_layer:
			canvas_layer.toggle_visibility()


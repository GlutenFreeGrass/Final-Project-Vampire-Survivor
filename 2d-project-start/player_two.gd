extends CharacterBody2D

signal health_depleted2

var health = 100.0
@export var speed = 600

func _physics_process(delta):
	var direction = Input.get_vector("mve_left","mve_right", "mve_up", "mve_down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo2.play_walk_animation()
	else:
		%HappyBoo2.play_idle_animation()

	const DAMAGE_RATE = 25.0
	var overlapping_mobs = %HurtBox2.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted2.emit()
		
extends Node2D

#

@onready var pl2 = $PlayerTwo
@onready var game_over_screen := $Player/GameOver



func _ready():
	pass



func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout():
	spawn_mob()




func _on_player_health_depleted():
	$GameOver.visible= true
	$Player/Gun.visible = false
	$Player/Gun/Timer.wait_time = INF
	$Player.speed = 0
	$AudioStreamPlayer.stop()
	$Watch/ColorRect.stop()
	print("pl1 dead")



func _on_player_two_health_depleted_2():
	print("working?")




func _on_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")


func _on_mxhealth_pressed():
	if $Player.health == 100:
		$Player/ProgressBar.value = 100
		$Player.health = INF
	else:
		$Player/ProgressBar.value = 100
		$Player.health = 100


func _on_infhealth_pressed():
	if $Player.health == INF:
		$Player/ProgressBar.value = 100
		$Player.health = 100
	else:
		$Player/ProgressBar.value = 100
		$Player.health = INF # Replace with function body.


func _on_crzyspeed_pressed():
	if $Player.speed == 600:
		$Player.speed = 2000 # Replace with function body.
		$Player/DevPanel/ColorRect/Label2.text = "Player Speed = %d%%" % $Player.speed
	else:

		$Player.speed = 600
		$Player/DevPanel/ColorRect/Label2.text = "Player Speed = %d%%" % $Player.speed


func _on_healthdisplay_pressed():
	if $Player/Label.text.contains("Player Health ="):
		$Timer2.stop()
		$Player/Label.text = "Player"
	else:
		$Timer2.start()

func _updatehealth():
	$Player/Label.text = "Player Health = %d%%" % $Player.health

func _on_timer_2_timeout():
	_updatehealth()
	$Player/DevPanel/ColorRect/Label2.text = "Player Speed = %d%%" % $Player.speed

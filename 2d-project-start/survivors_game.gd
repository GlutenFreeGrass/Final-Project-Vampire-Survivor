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
	print("pl1 dead")



func _on_player_two_health_depleted_2():
	print("working?")




func _on_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")

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

	print("1")



func _on_player_two_health_depleted_2():
	print("working?")



extends CenterContainer

@onready var start_game_button = %StartGameButton

func _ready():
	pass

func _on_single_player_button_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")
	

func _on_quit_button_pressed():
	get_tree().quit()


func _on_two_player_button_pressed():
	print("wow you have friends?")
	

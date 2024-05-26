extends CharacterBody2D

@onready var enemy_gone = $AudioStreamPlayer2D

var health = 3


@onready var player = get_node("/root/Game/Player")
@onready var playerdos = get_node("/root/Game/PlayerTwo")
@export var speed: float = 300

@export var players: Array
	
	

func _ready():
		players = get_tree().get_nodes_in_group("players")
		
func get_closest_player() -> CharacterBody2D:
	var clost_plr = CharacterBody2D
	var clost_distnce = 99999
	for player in players:
		if player != CharacterBody2D:
			var distance = global_position.distance_to(player.global_position)
			if distance < clost_distnce:
				clost_distnce = distance
				clost_plr = player
	return clost_plr
	
	%Slime.play_walk()

func _physics_process(delta):
	var player = get_closest_player()
	if player:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()
	else:
		print("??????")
func take_damage():
	health -= 1
	$Slime.play_hurt()
	enemy_gone.play()
	
	if health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position

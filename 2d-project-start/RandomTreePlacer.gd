extends Node2D

@onready var timer = $Timer
var pine_tree = preload("res://pine_tree.tscn")

func _ready():
	get_node("Timer").timeout.connect(_on_timer_timeout)
	timer.start()
	

func _on_timer_timeout():
	var tree_item = pine_tree.instantiate()
	var viewport_size = get_viewport_rect().size
	var random_tree = Vector2(0, 0)
	random_tree.x = randf_range(0, 10000)
	random_tree.y = randf_range(0, 10000)
	tree_item.position = random_tree
	add_child(tree_item)

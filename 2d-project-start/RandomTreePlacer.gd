extends Node2D

var pine_tree = preload("res://pine_tree.tscn")

func _ready():
	get_node("Timer").timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	var tree_item = pine_tree.instantiate()
	var viewport_size = get_viewport_rect().size
	var random_tree = Vector2(0, 0)
	random_tree.x = randf_range(0, viewport_size.x)
	random_tree.y = randf_range(0, viewport_size.y)
	tree_item.position = random_tree
	add_child(tree_item)

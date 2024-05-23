extends Node


@onready var players := {
	"1": {
		viewport = $HBoxContainer/SubViewportContainer/SubViewport,
		cam = $HBoxContainer/SubViewportContainer/SubViewport/Camera2D,
		plyr = $HBoxContainer/SubViewportContainer/SubViewport/Game/Player,
	},
	"2": {
		viewport = $HBoxContainer/SubViewportContainer2/SubViewport,
		cam = $HBoxContainer/SubViewportContainer2/SubViewport/Camera2D,
		plyr = $HBoxContainer/SubViewportContainer/SubViewport/Game/PlayerTwo,
	}
	
}


func _ready() -> void:
	players["2"].viewport.world_2d = players["1"].viewport.world_2d
	
	for node in players.values():
		var remote_transform := RemoteTransform2D.new()
		remote_transform.remote_path = node.cam.get_path()
		node.plyr.add_child(remote_transform)

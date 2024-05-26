extends Node

signal random_signal



@onready var players := {
	"1": {
		viewport = $HBoxContainer/SubViewportContainer/SubViewport,
		cam = $HBoxContainer/SubViewportContainer/SubViewport/Camera2D,
		plyr = $HBoxContainer/SubViewportContainer/SubViewport/Game2/Player,

	},
	"2": {
		viewport = $HBoxContainer/SubViewportContainer2/SubViewport,
		cam = $HBoxContainer/SubViewportContainer2/SubViewport/Camera2D,
		plyr = $HBoxContainer/SubViewportContainer/SubViewport/Game2/PlayerTwo,
		
	}
	
}
	
func _ready() -> void:
	players["2"].viewport.world_2d = players["1"].viewport.world_2d

	for node in players.values():
		var remote_transform := RemoteTransform2D.new()
		remote_transform.remote_path = node.cam.get_path()
		node.plyr.add_child(remote_transform)
	knewclrrect()
	

	
@onready var rect := $HBoxContainer/SubViewportContainer/SubViewport/CanvasLayer/ColorRect

func knewclrrect() -> void:
	var secondbckgrd = rect.duplicate()

	secondbckgrd.name = "ColorRect2"

	players["2"].viewport.get_node("CanvasLayer/ColorRect").add_child(secondbckgrd)
	
func _on_player_two_health_depleted_2():
	$HBoxContainer/SubViewportContainer2/SubViewport/GameOver2.visible = true
	$HBoxContainer/SubViewportContainer/SubViewport/Game2/PlayerTwo/Gun.visible = false
	$HBoxContainer/SubViewportContainer/SubViewport/Game2/PlayerTwo/Gun/Timer.wait_time = INF
	$HBoxContainer/SubViewportContainer/SubViewport/Game2/PlayerTwo.speed = 0
	#players["2"].viewport.set_process_mode(Viewport.PROCESS_MODE_DISABLED)

func _on_player_health_depleted():
	$HBoxContainer/SubViewportContainer/SubViewport/Game2/GameOver.visible = true
	$HBoxContainer/SubViewportContainer/SubViewport/Game2/Player/Gun.visible = false
	$HBoxContainer/SubViewportContainer/SubViewport/Game2/Player/Gun/Timer.wait_time = INF
	$HBoxContainer/SubViewportContainer/SubViewport/Game2/Player.speed = 0
	#players["1"].viewport.set_process_mode(Viewport.PROCESS_MODE_DISABLED)

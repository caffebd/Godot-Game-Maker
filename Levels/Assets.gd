extends Control



func _on_Menu_pressed():
	var loadLevel = "res://kobirmenu/MainMenuKobir.tscn"
	var _nextScene = get_tree().change_scene(loadLevel)


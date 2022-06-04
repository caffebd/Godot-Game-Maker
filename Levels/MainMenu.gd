extends Control


func _ready():
	Inventory.currentLevel = 0
	$VBoxContainer/HBoxContainer/Music.pressed = Inventory.music_on

func _on_Play_pressed():
	$TransitionScene.transition()
#	var loadLevel = "res://Levels/BangladeshNow.tscn"
#	var _nextScene = get_tree().change_scene(loadLevel)




func _on_Music_toggled(button_pressed):
	print (button_pressed)
	Inventory.music_on = button_pressed


func _on_Thanks_pressed():
	var loadLevel = "res://Levels/Assets.tscn"
	var _nextScene = get_tree().change_scene(loadLevel)


func _on_Credits_pressed():
	var loadLevel = "res://Levels/Credits.tscn"
	var _nextScene = get_tree().change_scene(loadLevel)


func _on_Instructions_pressed():
	var loadLevel = "res://Levels/Instructions.tscn"
	var _nextScene = get_tree().change_scene(loadLevel)

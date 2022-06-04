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

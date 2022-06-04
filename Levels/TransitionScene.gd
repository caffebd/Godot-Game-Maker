extends CanvasLayer

signal transition_done

var normal_fade_done = false

func _ready():
	$AnimationPlayer.play("fade_to_normal")

func transition():
	$AnimationPlayer.play("fade_to_black")


func _on_AnimationPlayer_animation_finished(anim_name):
	print (anim_name)
	if anim_name == "fade_to_black":
		emit_signal("transition_done")
		var loadLevel = Inventory.levels[Inventory.currentLevel]
		var _nextScene = get_tree().change_scene(loadLevel)



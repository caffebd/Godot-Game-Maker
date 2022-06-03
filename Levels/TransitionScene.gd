extends CanvasLayer

signal transition_done

func _ready():
	$AnimationPlayer.play("fade_to_normal")

func transition():
	$AnimationPlayer.play("fade_to_black")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("transition_done")
#		$AnimationPlayer.play("fade_to_normal")
	if anim_name == "fade_to_normal":
		print ("back to normal")

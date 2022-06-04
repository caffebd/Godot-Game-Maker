extends Area2D

var scientistDone = false

func _on_Scientist_body_entered(body):
	if body.get_groups().has("player") and not scientistDone:
		scientistDone = true
		body.is_active = false
		$Tween.interpolate_property(self, "position", position, Vector2(position.x-450, position.y), 2.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$AnimatedSprite.play("walk")
		$Tween.start()

func scientist_leave():
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.play("walk")
	$TweenLeave.interpolate_property(self, "position", position, Vector2(position.x+1000, position.y), 3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$TweenLeave.start()	



func _on_TweenLeave_tween_completed(_object, _key):
	queue_free()


func _on_Tween_tween_completed(object, key):
	$AnimatedSprite.play("idle")

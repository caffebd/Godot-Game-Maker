extends Area2D

var scientistDone = false

func _on_Scientist_body_entered(body):
	if body.get_groups().has("player") and not scientistDone:
		scientistDone = true
		body.is_active = false
		$Tween.interpolate_property(self, "position", position, Vector2(position.x-500, position.y), 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()

func scientist_leave():
		$TweenLeave.interpolate_property(self, "position", position, Vector2(position.x+2000, position.y), 4, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$TweenLeave.start()	


func _on_TweenLeave_tween_completed(_object, _key):
	queue_free()

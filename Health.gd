extends Area2D



func _on_Health_body_entered(body):
	var groups = body.get_groups()
	if groups.has("player"):
		visible = false
		set_collision_layer_bit(0, false)
		set_collision_mask_bit(0, false)
		$CollectSound.play()
		


func _on_CollectSound_finished():
	queue_free()

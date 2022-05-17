extends Area2D



func _on_Health_body_entered(body):
	var groups = body.get_groups()
	if groups.has("player"):
		queue_free()

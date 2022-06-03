extends Area2D

signal tissue_collected

func _on_Tissue_body_entered(body):
	emit_signal("tissue_collected")
	queue_free()



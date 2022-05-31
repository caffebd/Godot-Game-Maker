extends StaticBody2D


func _on_Vine_log_fall():
	print (rotation)
	$Tween.interpolate_property(self, "rotation_degrees", rotation_degrees, -rotation_degrees+90, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

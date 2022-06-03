extends StaticBody2D



func the_log_fall():
	$Tween.interpolate_property(self, "rotation_degrees", rotation_degrees, -rotation_degrees+90, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

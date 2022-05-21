extends Area2D

var can_use: bool = false
var switch_on: bool = false

signal control(state)

func _process(_delta):
	
	if Input.is_action_just_pressed("use") and can_use == true:
		switch_on = !switch_on
		if switch_on:
			$SoundOn.play()
			$AnimatedSprite.animation = "on"
			$AnimatedSprite.play()
			emit_signal("control", true)
		else:
			$SoundOff.play()
			$AnimatedSprite.animation = "off"
			$AnimatedSprite.play()
			emit_signal("control", false)
	


func _on_Switch_body_entered(body):
	var groups = body.get_groups()
	if groups.has("player"):
		$Label.visible = true
		can_use = true


func _on_Switch_body_exited(body):
	var groups = body.get_groups()
	if groups.has("player"):
		$Label.visible = false
		can_use = false

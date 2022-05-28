extends Area2D

var is_typing: bool = false

onready var player = get_node("../Player")

func _process(_delta):
	var collision = get_overlapping_bodies()
	for i in collision:
		if i.get_groups().has("player"):
			if Input.is_action_just_pressed("toggle_type"):
				is_typing = !is_typing
				if is_typing:
					$Terminal.editable = true
					$Terminal.grab_focus()
					player.is_active = false
				else:
					$Terminal.editable = false
					player.is_active = true
					
	if is_typing and Input.is_action_just_pressed("enter"):
		get_parent().check_command($Terminal.text)
		





func _on_Terminal_body_entered(_body):
	$Sprite/escText.visible = true



func _on_Terminal_body_exited(_body):
	$Sprite/escText.visible = false

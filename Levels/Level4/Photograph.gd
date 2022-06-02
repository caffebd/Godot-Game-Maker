extends Area2D

onready var player = get_node("../RobotPlayer")
var playerNear = false

func _on_Photograph_body_entered(body):
	var groups = body.get_groups()
	if groups.has("player"):
		$Label.visible = true
		playerNear = true


func _on_Photograph_body_exited(body):
	if body.get_groups().has("player"):
		$Label.visible = false
		playerNear = false

func _input(_event):
	if Input.is_action_just_pressed("collect"):
		if playerNear:
			playerNear = false		
			Inventory.add_to_inventory("photograph")
			player.update_inventory()
			queue_free()

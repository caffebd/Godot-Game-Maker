extends Area2D

onready var player = get_node("../RobotPlayer")

signal continue_conversation

var squashed = false

func _input(_event):
	if Input.is_action_just_pressed("attack"):
		emit_signal("continue_conversation")

func _on_Grass_body_entered(body):
	if body.get_groups().has("player") and not squashed:
		squashed = true
		$CrunchSound.play()
		$AnimatedSprite.play("grassSquash")
		Inventory.plantsSquashed += 1
	
		if Inventory.plantsSquashed < 3:
			player.is_active = false
			player.get_node("Speaker").text = "Roksana"
			player.get_node("MainSpokenText").text ="Maybe I should be more careful"
			player.get_node("Speaker").visible = true
			player.get_node("MainSpokenText").visible = true
			yield (self, "continue_conversation")
			player.is_active = true
			player.get_node("Speaker").visible = false
			player.get_node("MainSpokenText").visible = false


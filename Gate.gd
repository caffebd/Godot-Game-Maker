extends Area2D

onready var player = get_node("../Player")

var complete = false

func _on_Gate_body_entered(body):
	if body.get_groups().has("player") and not complete:
		$hint.visible = true
		Inventory.current_action_object = self



func _on_Gate_body_exited(body):
	if body.get_groups().has("player"):
		$hint.visible = false
		Inventory.current_action_object = null
	
func check_action(obj, index):
	if obj == "key":
		$AnimatedSprite.animation = "open"
		$AnimatedSprite.play()
		$MainBody/BodyCollision.disabled=true
		$hint.visible = false
		Inventory.myInventory.remove(index)
		player.update_inventory()
		complete = true
	else:
		print ("WRONG")

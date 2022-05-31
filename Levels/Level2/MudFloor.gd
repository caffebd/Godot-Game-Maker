extends StaticBody2D

onready var player = get_node("../RobotPlayer")

func check_action(obj, index):
	if obj == "stick":
		Inventory.myInventory.remove(index)
		player.update_inventory()
		$CollisionShape2D.disabled=true
		visible = false		
		get_parent().broke_stick()


func _on_Area2D_body_entered(body):
	if body.get_groups().has("player"):
		$StickHint.visible = true
		Inventory.current_action_object = self


func _on_Area2D_body_exited(body):
	if body.get_groups().has("player"):
		$StickHint.visible = false
		Inventory.current_action_object = null

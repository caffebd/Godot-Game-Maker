extends Area2D

onready var player = get_node("../RobotPlayer")

func _on_Grass_body_entered(body):
	if body.get_groups().has("player"):
		Inventory.add_to_inventory("grass")
		player.update_inventory()
		queue_free()



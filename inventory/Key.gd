extends Area2D

onready var player = get_node("../Player")

func _on_Key_body_entered(body):
	if body.get_groups().has("player"):
		Inventory.add_to_inventory("key")
		player.update_inventory()
		queue_free()

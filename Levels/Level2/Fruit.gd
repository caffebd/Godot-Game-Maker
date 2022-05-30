extends Area2D


onready var player = get_node("../RobotPlayer")
var playerNear = false


func _on_Fruit_body_entered(body):
	var groups = body.get_groups()
	if groups.has("player"):
		$Label.visible = true
		playerNear = true





func _on_Fruit_body_exited(body):
	if body.get_groups().has("player"):
		$Label.visible = false
		playerNear = false

func _input(_event):
	if playerNear and Input.is_action_just_pressed("collect"):
		Inventory.add_to_inventory("fruit")
		player.update_inventory()
		queue_free()


func _on_Fruit_area_entered(area):
	var groups = area.get_groups()
	if groups.has("eater"):
		area.get_parent().eat()
		queue_free()

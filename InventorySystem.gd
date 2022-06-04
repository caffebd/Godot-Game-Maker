extends Control

var currentlySelected: int = -1



func _on_ItemList_item_selected(index):
	print (Inventory.myInventory[index])
	
	if Inventory.myInventory[index] == "iTime15":
		if Inventory.canChangeLevel:
			
			var loadLevel = "res://Levels/TimeTravel.tscn"
			var _nextScene = get_tree().change_scene(loadLevel)
		elif Inventory.science_changed:
			var _nextScene = get_tree().change_scene("res://Levels/BangladeshNow.tscn")
		else:
			get_parent().restart(false)
		

		
	if Inventory.current_action_object != null:
		Inventory.current_action_object.check_action(Inventory.myInventory[index], index)	
	else:	
		get_parent().drop_item(Inventory.myInventory[index], index)
	
#	if Inventory.current_action_object != null:
#		Inventory.current_action_object.check_action(Inventory.myInventory[index], index)

# for deselcting if needed???
#	if currentlySelected == index:
#		$ItemList.unselect_all()
#		currentlySelected = -1
#	else:
#		currentlySelected = index
#		if 	Inventory.current_action_object != null:
#			Inventory.current_action_object.check_action(Inventory.myInventory[index], index)




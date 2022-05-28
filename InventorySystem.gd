extends Control

var currentlySelected: int = -1


func _on_ItemList_item_selected(index):
	
	if Inventory.myInventory[index] == "iTime15":
		if Inventory.canChangeLevel:
			
			var loadLevel = Inventory.levels[Inventory.currentLevel]
			var _nextScene = get_tree().change_scene(loadLevel)
		return
	
	if Inventory.current_action_object != null:
		Inventory.current_action_object.check_action(Inventory.myInventory[index], index)

# for deselcting if needed???
#	if currentlySelected == index:
#		$ItemList.unselect_all()
#		currentlySelected = -1
#	else:
#		currentlySelected = index
#		if 	Inventory.current_action_object != null:
#			Inventory.current_action_object.check_action(Inventory.myInventory[index], index)




extends TileMap







func _on_Switch_control(state):
	visible = state
	set_collision_layer_bit(0, state)
	set_collision_mask_bit(0, state)

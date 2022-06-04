extends Node2D

func _ready():
	$AudioStreamPlayer.play()
	if Inventory.currentLevel == 0 or Inventory.currentLevel == 1:
		$Girl.position = Vector2($Girl.position.x+170, $Girl.position.y)
	if Inventory.currentLevel == 2:
		$With.texture= load("res://assets/family/dad/father.png")
	if Inventory.currentLevel == 3:
		$With.texture= load("res://assets/family/mum/mother.png")
	if Inventory.currentLevel == 4:
		$With.texture= load("res://assets/family/brother/boy.png")
	yield(get_tree().create_timer(3.0), "timeout")
	$TransitionScene.transition()
	
func _process(delta):
	$Girl.rotation_degrees +=  delta * 100
	$With.rotation_degrees -=  delta * 100
	
	

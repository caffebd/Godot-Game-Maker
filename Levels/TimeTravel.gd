extends Node2D

func _ready():
	var girlPos = get_viewport_rect().size / 2

	
	$AudioStreamPlayer.play()
	if Inventory.currentLevel == 0 or Inventory.currentLevel == 1:
		$Girl.position = girlPos
	else:
		$Girl.position = Vector2(girlPos.x - 150, girlPos.y)
		$With.position = Vector2(girlPos.x + 150, girlPos.y)
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
	
	

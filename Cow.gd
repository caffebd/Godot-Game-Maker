extends StaticBody2D

onready var player = get_node("../Player")
export var distance: int = 400
export var speed: float = 100
export var moving: bool = false
var startPos:Vector2 = Vector2.ZERO
var canDie: bool = false
var complete = false


func _ready():
	startPos = position
	$CowAnimatedSprite.animation = "idle"
	$CowAnimatedSprite.play()

func _process(delta):
	if not moving:
		return
		
	if position.x < startPos.x + distance && !$CowAnimatedSprite.flip_h:	
		position.x += speed * delta
		if position.x >= startPos.x + distance:
			$CowAnimatedSprite.flip_h = true
	elif position.x > startPos.x && $CowAnimatedSprite.flip_h:
		position.x -= speed * delta
		if position.x <= startPos.x:
			$CowAnimatedSprite.flip_h = false

func check_action(obj, index):
	if obj == "grass":
		$BodyCollision.disabled=true
		$CowAnimatedSprite.animation = "eat"
		$CowAnimatedSprite.play()
		$hint.visible = false
		Inventory.myInventory.remove(index)
		player.update_inventory()
		complete = true
	else:
		print ("WRONG")


func _on_VisibilityEnabler2D_screen_entered():
	canDie = true


func _on_VisibilityEnabler2D_screen_exited():
	canDie = false



func _on_Area2D_body_entered(body):
	if body.get_groups().has("player") and not complete:
		$hint.visible = true
		Inventory.current_action_object = self


func _on_Area2D_body_exited(body):
	if body.get_groups().has("player"):
		$hint.visible = false
		Inventory.current_action_object = null

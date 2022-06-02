extends StaticBody2D

onready var player = get_node("../RobotPlayer")
export var distance: int = 400
export var speed: float = 100
export var moving: bool = false
var startPos:Vector2 = Vector2.ZERO
var complete = false


func _ready():
	startPos = position
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.play()

func _process(delta):
	if not moving:
		return
	
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.play()
		
	if position.x <= startPos.x + distance && !$AnimatedSprite.flip_h:	
		position.x += speed * delta
		if position.x >= startPos.x + distance:
			$AnimatedSprite.flip_h = true
	elif position.x > startPos.x && $AnimatedSprite.flip_h:
		position.x -= speed * delta
		if position.x <= startPos.x:
			$AnimatedSprite.flip_h = false

func eat():
	moving = false
	$AnimatedSprite.play("eat")
	$MainBody.call_deferred("set", "disabled", true)

	




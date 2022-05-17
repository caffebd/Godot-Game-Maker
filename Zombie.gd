extends StaticBody2D

export var distance: int = 50
export var speed: float = 0.5
var startPos:Vector2 = Vector2.ZERO


func _ready():
	startPos = position

func _process(delta):
	if position.x < startPos.x + distance && !$AnimatedSprite.flip_h:	
		position.x += speed * delta
		if position.x >= startPos.x + distance:
			$AnimatedSprite.flip_h = true
	elif position.x > startPos.x && $AnimatedSprite.flip_h:
		position.x -= speed * delta
		if position.x <= startPos.x:
			$AnimatedSprite.flip_h = false

	
	



func _on_Area2D_area_entered(area):
	var groups = area.get_groups()
	if groups.has("robot_shoot"):
		queue_free()	

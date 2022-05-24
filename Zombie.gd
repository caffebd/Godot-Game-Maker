extends StaticBody2D

export var distance: int = 50
export var speed: float = 0.5
var startPos:Vector2 = Vector2.ZERO
var canDie: bool = false


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
	if canDie:
		var groups = area.get_groups()
		if groups.has("robot_shoot"):
			queue_free()	


func _on_VisibilityEnabler2D_screen_exited():
	canDie = false
	



func _on_VisibilityEnabler2D_screen_entered():
	canDie = true

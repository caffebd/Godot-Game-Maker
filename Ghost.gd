extends Area2D

export var distance: int = 50
export var speed: float = 0.5
var startPos:Vector2 = Vector2.ZERO

signal player_detected


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
	
	var collision = get_overlapping_bodies()
	for i in collision:
		if i.get_groups().has("player"):
			emit_signal("player_detected")

	
# Replace with function body.


func _on_Ghost_area_entered(area):
	var groups = area.get_groups()
	if groups.has("robot_shoot"):
		queue_free()	

extends Area2D

var speed: int = 500
var direction: int = 1
var startPosition: Vector2 = Vector2.ZERO

func _ready():
	position = startPosition
	$ShootSound.play()

func _process(delta):
	$Sprite.flip_h = direction < 0
	position.x += speed * delta * direction


func _on_Robot_Shoot_area_entered(area):
	var groups = area.get_groups()
	if groups.has("enemy"):
		queue_free()

func _on_Robot_Shoot_body_entered(body):
	var groups = body.get_groups()
	if groups.has("map"):
		queue_free()




#enable to remove when leaving screen

func _on_VisibilityNotifier2D_screen_exited():
	#queue_free()
	pass


#use timer to keep alive even when left screen
#enables shooting of enemies off screen

func _on_Timer_timeout():
	queue_free()




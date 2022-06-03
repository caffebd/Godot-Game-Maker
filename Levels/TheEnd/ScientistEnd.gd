extends Node2D

var scientistDone

onready var arrows = get_node("../AnimatedArrows")

var speed = 10
export var multiplier = 1
var move_direction = 0
var fly_away = false

onready var camera = get_node("../RobotPlayer/PlayerCam")

func _on_Area2D_body_entered(body):
	if body.get_groups().has("player") and not scientistDone:
		scientistDone = true
		body.is_active = false
		arrows.visible = false
		$AudioStreamPlayer2D.play()
		$TweenEnter.interpolate_property(self, "position", position, Vector2(position.x+360, position.y), 4, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Path2D/PathFollow2D/AnimatedSpriteCar.play("scientist")
		$TweenEnter.start()

func _on_TweenEnter_tween_completed(object, key):
	yield(get_tree().create_timer(0.7), "timeout")
	$Path2D/PathFollow2D/AnimatedSpriteCar.play("empty")
	$Area2D/AnimatedSpriteMan.visible = true
	
func scientist_leave():
	$AudioStreamPlayer2D.play()
	$Area2D/AnimatedSpriteMan.visible = false
	$Path2D/PathFollow2D/AnimatedSpriteCar.flip_h = false
	$Path2D/PathFollow2D/AnimatedSpriteCar.play("scientist")
	$TweenLeave.interpolate_property(self, "position", position, Vector2(position.x-1000, position.y), 5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$TweenLeave.start()
	
	
func _physics_process(delta):
	if fly_away:
		multiplier = multiplier *1.0005
		speed = speed * multiplier
		var zoomX = camera.zoom.x
		var zoomY = camera.zoom.x
		camera.zoom = Vector2(zoomX * 1.005, zoomY * 1.005)		
		$Path2D/PathFollow2D.set_offset($Path2D/PathFollow2D.get_offset()+speed*delta)
		if $Path2D/PathFollow2D.offset > 800:
			get_node("../TransitionScene").transition()
		if $Path2D/PathFollow2D.offset > 850:			
			fly_away = false
	
func scientist_roksana_leave():
	$Path2D/PathFollow2D/AnimatedSpriteCar.play("both")
	$Path2D/PathFollow2D/AnimatedSpriteCar.flip_h=false
	$Area2D/AnimatedSpriteMan.visible = false
	$ShipTakeOff.play()
	yield(get_tree().create_timer(1.5), "timeout")
	fly_away = true
	
#func scientist_roksana_leave():
#	$Camera2D.current = true
#	$AnimatedSpriteCar.flip_h = true
#	$AnimatedSpriteCar.play("drive")
#	$TweenLeave.interpolate_property(self, "position", position, Vector2(position.x-1000, position.y), 3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#	$TweenLeave.start()	
		


func _on_RoksanaArea_body_entered(body):
	if body.get_groups().has("player"):
		body.visible = false
		scientist_roksana_leave()




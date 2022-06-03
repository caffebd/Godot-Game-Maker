extends Area2D

signal log_fall

var active = true

export var duration = 1

export(NodePath) var myLogPath

onready var myLog = get_node(myLogPath)

func move_down():
	var target = Vector2.ZERO
	target.x = position.x
	target.y = position.y+40
	set_tween(position, target)
	
func set_tween(from, to):
		var _moving = $Tween.interpolate_property(self, "position", from, to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		var _moveStart = $Tween.start()
		myLog.the_log_fall()


func _input(_event):
	if Input.is_action_just_pressed("collect") and $Label.visible:
		$Label.visible = false
		active = false
		move_down()

func _on_Vine_body_entered(body):
	if body.get_groups().has("player") and active:
		$Label.visible = true


func _on_Vine_body_exited(body):
	if body.get_groups().has("player"):
		$Label.visible = false

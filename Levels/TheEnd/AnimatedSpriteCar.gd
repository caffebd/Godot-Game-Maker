extends AnimatedSprite

onready var path_follow = get_node("../../Path2D/PathFollow2D")

var speed = 150
var move_direction = 0

func _physics_process(delta):
	MovementLoop(delta)

func MovementLoop(delta):
	var prepos = path_follow.get_global_position()
	print (prepos)
	path_follow.set_offset(path_follow.get_offset() + speed * delta)
	var pos = path_follow.get_global_position()
	move_direction = (pos.angle_to_point(prepos) / 3.14) * 180

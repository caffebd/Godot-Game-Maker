extends Area2D

var t = 0.0

var speed = 0.02

export(Curve) var hop_curve 
export var distance = 200.0

var y_offset = 0.0
var x_start = 0.0


var x_curve = 0.0
var y_curve = 0.0

var x_curve_multiplier = 5

func _ready():
	y_offset = 0 + position.y
	x_start = position.x
	print (y_offset)
	

func _process(delta):
	x_curve += delta
	var y_curve = hop_curve.interpolate(x_curve)
	position = Vector2(position.x + x_curve*x_curve_multiplier, (y_curve*100 + y_offset))
	if x_curve >=1:
		 x_curve = 0.0
	if position.x >= x_start + distance or position.x <= x_start:
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
		x_curve_multiplier = x_curve_multiplier *-1
		
	
	

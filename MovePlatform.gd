tool
extends Node2D

export var duration: float = 1
export var move_from: Vector2 = Vector2.ZERO
export var move_to: Vector2 = Vector2.ZERO

export var active: bool = true

onready var line: Node2D = $Debug_Line
onready var base: Node2D = $Base
onready var tween: Tween = $Base/Tween

var direction_forward = true

func _ready():
	if not Engine.is_editor_hint():
		set_tween(move_from, move_to)

func _process(_delta):
	if Engine.is_editor_hint():
		update()

func _draw():
	if Engine.is_editor_hint():
		if line:
			draw_line(line.position + move_from, line.position + move_to, Color.lime,2)
			


func set_tween(from, to):
	if active:
		tween.interpolate_property(base, "position", from, to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()


func _on_Tween_tween_completed(object, key):
	
	direction_forward = !direction_forward
	
	if direction_forward:
		set_tween(move_from, move_to)
	else:
		set_tween(move_to, move_from)
	
	
		


func _on_Switch2_control(state):
	active = state
	if active:
		if direction_forward:
			set_tween(move_from, move_to)
		else:
			set_tween(move_to, move_from)

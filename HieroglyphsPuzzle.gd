extends Node2D

var selected = []
var correct_order = ["store", "farm", "fisherman", "doctor"]

var is_active = true

export(NodePath) var node_path

var current_button:String = ""

onready var wall = get_node(node_path)

func reset_button():
	$ResetAudio.play()
	selected.clear()
	$Button1/Farm.play("notpressed")
	$Button2/Doctor.play("notpressed")
	$Button3/Store.play("notpressed")
	$Button4/Fisherman.play("notpressed")

func check_answer():
	if selected.size() == 4:
		if selected == correct_order:
			is_active = false
			$AudioStreamPlayer2D.play()
			wall.queue_free()
		else:
			reset_button()
			print ("FAIL")
		
	

func _on_Button1_pressed():
	if not is_active:
		return
		
	if selected.has("farm"):
		reset_button()
	else:
		$PushAudio.play()
		$Button1/Farm.play("pressed")
		selected.push_back("farm")
#		check_answer()


func _on_Button2_pressed():
	if not is_active:
		return
		
	if selected.has("doctor"):
		reset_button()
	else:
		$PushAudio.play()
		$Button2/Doctor.play("pressed")
		selected.push_back("doctor")
#		check_answer()


func _on_Button3_pressed():
	if not is_active:
		return
		
	if selected.has("store"):
		reset_button()
	else:
		$PushAudio.play()
		$Button3/Store.play("pressed")
		selected.push_back("store")
#		check_answer()


func _on_Button4_pressed():
	if not is_active:
		return
		
	if selected.has("fisherman"):
		reset_button()
	else:
		$PushAudio.play()
		$Button4/Fisherman.play("pressed")
		selected.push_back("fisherman")
#		check_answer()
		
func _input(event):
	if Input.is_action_just_pressed("collect"):
		match current_button:
			"farm":
				_on_Button1_pressed()
			"doctor":
				_on_Button2_pressed()
			"store":
				_on_Button3_pressed()
			"fisherman":
				_on_Button4_pressed()
				
				




func _on_FarmArea2D_body_entered(body):
	if body.get_groups().has("player") and is_active:
		$Button1/FarmArea2D/Label.visible=true
		current_button = "farm"



func _on_FarmArea2D_body_exited(body):
	if body.get_groups().has("player"):
		$Button1/FarmArea2D/Label.visible=false
		current_button = ""



func _on_DoctorArea2D_body_entered(body):
	if body.get_groups().has("player") and is_active:
		$Button2/DoctorArea2D/Label2.visible=true
		current_button = "doctor"


func _on_DoctorArea2D_body_exited(body):
	if body.get_groups().has("player"):
		$Button2/DoctorArea2D/Label2.visible=false
		current_button = ""
	

func _on_StoreArea2D_body_entered(body):
	if body.get_groups().has("player") and is_active:
		
		$Button3/StoreArea2D/Label3.visible=true
		current_button = "store"


func _on_StoreArea2D_body_exited(body):
	if body.get_groups().has("player"):
		$Button3/StoreArea2D/Label3.visible=false
		current_button = ""




func _on_FisherArea2D_body_entered(body):
	if body.get_groups().has("player") and is_active:
		$Button4/FisherArea2D/Label4.visible=true
		current_button = "fisherman"


func _on_FisherArea2D_body_exited(body):
		$Button4/FisherArea2D/Label4.visible=false
		current_button = ""


func _on_PushAudio_finished():
	check_answer()

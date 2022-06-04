extends Node2D

signal continue_conversation
signal inv_tutorial

#onready var speechWindow: RichTextLabel = get_node("../Player/MainSpokenText")

var shopDone = false
var farmerDone = false
var fisherDone = false
var doctorDone = false
var homeDone = false
var scientistDone = false

var scienceChange = false

func _ready():
	Inventory.currentLevel = 1
	if Inventory.music_on:
		$BackgroundMusic.play()
	if Inventory.doctorChange or Inventory.fisherChange or Inventory.farmChange or Inventory.shopChange:
		scienceChange = true
		Inventory.science_changed = true	
	_conversation("roksanaFamily", "")
	#TEMP CODE FOR TEST
	Inventory.add_to_inventory("iTime15")
	$RobotPlayer.update_inventory()
	#END TEMP CODE
	
func _on_Shop_body_entered(body):
	if body.get_groups().has("player") and not shopDone:
		shopDone = true
		if Inventory.shopChange:
			_conversation("mrbanorChange", "roksanaBanorChange")
		else:
			_conversation("roksanaBanor", "mrbanor")

func _on_Farmer_body_entered(body):
	if body.get_groups().has("player") and not farmerDone:
		farmerDone = true
		if Inventory.farmChange:
			_conversation("roksanaFarmerChange", "mrkrishiChange")
		else:
			_conversation("mrkrishi", "roksanaFarmer")
		
func _on_Fisherman_body_entered(body):
	if body.get_groups().has("player") and not fisherDone:
		fisherDone = true
		if Inventory.fisherChange:
			_conversation("roksanaFisherChange", "mrilishChange")
		else:
			_conversation("roksanaFisher", "mrilish")
			
func _on_Doctor_body_entered(body):
	if body.get_groups().has("player") and not doctorDone:
		doctorDone = true
		if Inventory.doctorChange:
			_conversation("roksanaDoctorChange", "drrugiChange")
		else:
			_conversation("roksanaDoctor", "drrugi")

func _on_Home_body_entered(body):
	if body.get_groups().has("player") and not homeDone:
		homeDone = true
		if Inventory.homeChange:
			_conversation("roksanaHomeChange", "")
		else:
			_conversation("roksanaHome", "")
	if body.get_groups().has("player") and scientistDone:
		$TransitionScene.transition() 

func _conversation(personA: String, personB: String):
	$RobotPlayer.is_active = false
	$RobotPlayer/MainSpokenText.visible = true
	$RobotPlayer/Speaker.visible = true
	
	var speaker = "none"

	var partA = Level5SpokenText.people[personA]
	var partB = []
	if personB != "":
		partB = Level5SpokenText.people[personB]

	for i in partA.size():
		speaker = _get_person_name(personA)
		$RobotPlayer/Speaker.text = speaker
		$RobotPlayer/MainSpokenText.text = partA[i]
		yield (self, "continue_conversation")		
		if partB.size() > 0 and i <= partB.size()-1:
			speaker = _get_person_name(personB)
			$RobotPlayer/Speaker.text = speaker
			$RobotPlayer/MainSpokenText.text = partB[i]
			yield (self, "continue_conversation")
			print (i)
		
			if personB == "scientistChange" and i == 8:
				$ScientistEnd.scientist_leave()	
	$RobotPlayer/MainSpokenText.text = ""
	$RobotPlayer/MainSpokenText.visible = false
	$RobotPlayer/Speaker.visible = false
	$RobotPlayer.is_active = true
	
	if personB == "scientist":
		Inventory.myInventory.remove(0)
		$RobotPlayer.update_inventory()	
#
	if personB == "scientistChange":					
		$RobotPlayer.open_inventory()
	if "banor" in personB or "banor" in personA:
		$AnimatedArrows.play()
		$AnimatedArrows.visible = true


func _get_person_name(person: String):
	var speaker = person
	if "roksana" in person:
		speaker = "Roksana"
	if "scientist" in person:
		speaker = "Scientist"
	if "drrugi" in person:
		speaker = "Dr Rugi"
	if "mrilish" in person:
		speaker = "Mr Ilish"
	if "mrkrishi" in person:
		speaker = "Mr Krishi"
	if "mrbanor" in person:
		speaker = "Mr Banor"			
	return speaker

func _input(_event):
	if Input.is_action_just_pressed("attack"):
		emit_signal("continue_conversation")
	if Input.is_action_just_pressed("show_inventory"):
		emit_signal("inv_tutorial")





func _on_TweenEnter_tween_completed(object, key):
	yield(get_tree().create_timer(0.8), "timeout")
		
	if not scientistDone:
		scientistDone = true
		if scienceChange: 
			_conversation("roksanaScientistChange", "scientistChange")
		else:
			_conversation("roksanaScientist", "scientist")





func _on_TransitionScene_transition_done():
	get_tree().change_scene("res://Levels/BangladeshNow.tscn")
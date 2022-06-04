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

func _on_Shop_body_entered(body):
	if body.get_groups().has("player") and not shopDone:
		shopDone = true
		_conversation("Mr Banor", "roksanaBanor")

func _on_Farmer_body_entered(body):
	if body.get_groups().has("player") and not farmerDone:
		farmerDone = true
		_conversation("Mr Krishi", "roksanaFarmer")
		
func _on_Fisherman_body_entered(body):
	if body.get_groups().has("player") and not fisherDone:
		fisherDone = true
		_conversation("Mr Ilish", "roksanaFisher")

func _on_Doctor_body_entered(body):
	if body.get_groups().has("player") and not doctorDone:
		doctorDone = true
		_conversation("Dr Rugi", "roksanaDoctor")


func _on_Home_body_entered(body):
	if body.get_groups().has("player") and not homeDone:
		homeDone = true
		_conversation("roksanaHome", "")

func _conversation(personA: String, personB: String):
	$RobotPlayer.is_active = false
	$RobotPlayer/MainSpokenText.visible = true
	$RobotPlayer/Speaker.visible = true

	var partA = Level1SpokenText.people[personA]
	var partB = []
	if personB != "":
		partB = Level1SpokenText.people[personB]

	for i in partA.size():
		var speaker = personA
		if "roksana" in speaker:
			speaker = "Roksana"
		$RobotPlayer/Speaker.text = speaker
		$RobotPlayer/MainSpokenText.text = partA[i]
		yield (self, "continue_conversation")		
		if partB.size() > 0 and i <= partB.size()-1:
			speaker = personB
			if "roksana" in speaker:
				speaker = "Roksana"
			$RobotPlayer/Speaker.text = speaker
			$RobotPlayer/MainSpokenText.text = partB[i]
			yield (self, "continue_conversation")
			if personB == "Scientist" and i == 7:
				$Scientist/flux.visible = true		
	$RobotPlayer/MainSpokenText.text = ""
	$RobotPlayer/MainSpokenText.visible = false
	$RobotPlayer/Speaker.visible = false
	
	if personB == "Scientist":
		$Scientist/flux.visible=false
		$Scientist.scientist_leave()
		Inventory.add_to_inventory("iTime15")
		$RobotPlayer.update_inventory()
		$RobotPlayer.show_player_info_box("Press 'Tab' to open inventory")
		$RobotPlayer/iTime.visible = true
		$RobotPlayer.is_active = true
		yield (self, "inv_tutorial")
		$RobotPlayer.show_player_info_box("Tap on the iTime15")		
		Inventory.canChangeLevel = true
		#$RobotPlayer.open_inventory()
	$RobotPlayer.is_active = true


func _input(_event):
	if Input.is_action_just_pressed("attack"):
		emit_signal("continue_conversation")
	if Input.is_action_just_pressed("show_inventory"):
		emit_signal("inv_tutorial")




func _on_Tween_tween_completed(_object, _key):
	if not scientistDone:
		scientistDone = true
		_conversation("roksanaScientist", "Scientist")

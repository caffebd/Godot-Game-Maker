extends Node

var currentLevel = 0

var levels = ["res://Levels/BangladeshNow.tscn", "res://Levels/Level2/Level2.tscn"]
var canChangeLevel = false

var myInventory: Array = []

var current_action_object

var theKey = load("res://assets/objects/key.png")
var theGrass = load("res://assets/objects/grass.png")
var iTime15 = load("res://assets/objects/itime15.png")

func _ready():
	print ("Inv system autolad")

func add_to_inventory(object: String):
	myInventory.push_back(object)
	print (myInventory)
	



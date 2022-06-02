extends Node

var music_on = true

var currentLevel = 0

var plantsSquashed = 0

var tissues_collected = 0

var levels = ["res://Levels/BangladeshNow.tscn", "res://Levels/LevelTest.tscn", "res://Levels/BangladeshNow.tscn"]
var canChangeLevel = false

var myInventory: Array = []

var current_action_object

var theBook = load("res://assets/Forest Objects/book.png")
var theFruit = load("res://assets/Dinosaur Objects/fruit_sample.png")
var theStick = load ("res://assets/Forest Objects/stick.png")
var theKey = load("res://assets/objects/key.png")
var theGrass = load("res://assets/objects/grass.png")
var iTime15 = load("res://assets/objects/itime15.png")
var thePhoto = load("res://assets/Bangladesh Objects/housetemp.jpeg")

func _ready():
	print ("Inv system autolad")

func add_to_inventory(object: String):
	myInventory.push_back(object)
	print (myInventory)
	



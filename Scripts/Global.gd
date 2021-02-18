extends Node


var currentLevel := 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var levels = [
	"res://scenes/Tutorial.tscn",
	"res://Scenes/ButtonIntro.tscn",
	"res://Scenes/SplitUp.tscn",
	"res://Scenes/KeyIntro.tscn",
	"res://Scenes/Spiral.tscn",
	"res://Scenes/Seporation.tscn",
	"res://Scenes/SpaceShipt.tscn"
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func loadLevel():
	get_tree().change_scene(levels[currentLevel])

func gameOver():
	loadLevel()

func nextLevel():
	if currentLevel < len(levels) - 1:
		currentLevel += 1
		loadLevel()

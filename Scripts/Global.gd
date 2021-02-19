extends Node


var currentLevel := 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var levels = [
	"res://Scenes/Tutorial.tscn",
	"res://Scenes/ButtonIntro.tscn",
	"res://Scenes/SplitUp.tscn",
	"res://Scenes/KeyIntro.tscn",
	"res://Scenes/Spiral.tscn",
	"res://Scenes/HelpMeOut.tscn",
	"res://Scenes/SpaceShip.tscn",
	"res://Scenes/Seporation.tscn",
	"res://Scenes/SoCloseYetSoFar.tscn",
	"res://Scenes/BackTogether.tscn",
	"res://Scenes/Thanks.tscn",
	"res://Scenes/Secret.tscn"
]

func loadLevel():
	get_tree().change_scene(levels[currentLevel])

func gameOver():
	loadLevel()

func nextLevel():
	if currentLevel < len(levels) - 1:
		currentLevel += 1
		loadLevel()

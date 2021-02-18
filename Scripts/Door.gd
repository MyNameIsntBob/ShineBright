extends Node2D

var open := false
var speed := 100
var openTo := 60

var buttonsActive := 0

func activate():
	buttonsActive += 1

func deactivate():
	buttonsActive -= 1
	
func _process(delta):
	var pos = $Sprite.position 
	if buttonsActive:
		if pos.x < 60:
			pos.x += speed * delta
		if pos.x > 60:
			pos.x = 60
		
	else:
		if pos.x > 0:
			pos.x -= speed * delta
		if pos.x < 0:
			pos.x = 0
			
	$Sprite.position = pos

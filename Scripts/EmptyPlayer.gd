extends KinematicBody2D

var maxHeight = 300
var minHeight = -300

var minSize = 1.5
var maxSize = 5

func _process(delta):
	
	var relativePos = (self.get_global_position().y - minHeight)/maxHeight
	if relativePos < 0:
		relativePos = 0
	if relativePos > 1:
		relativePos = 1
	
	var heightDif = maxHeight - minHeight
	var sizeDif = maxSize - minSize
	
	var size = (sizeDif/heightDif * self.get_global_position().y) - (minHeight*sizeDif/heightDif) + minSize
	self.scale.y = size
	self.scale.x = size


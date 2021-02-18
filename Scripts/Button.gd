extends Sprite


export (Array, NodePath) var activates_paths

var activates : Array

var playersOnMe := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for path in activates_paths:
		activates.append(get_node(path))

func _on_Area2D_body_entered(body):
	if !playersOnMe: 
		for object in activates:
			if object:
				object.activate()
			
	playersOnMe += 1
	


func _on_Area2D_body_exited(body):
	playersOnMe -= 1
	
	if !playersOnMe:
		for object in activates:
			if object:
				object.deactivate()

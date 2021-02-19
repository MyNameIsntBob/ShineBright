extends Sprite

signal nextLevel

var finished := false
var ready := 0

func _process(delta):
	if ready >= 2 and !finished:
		emit_signal("nextLevel")
		finished = true


func _on_Area2D_body_entered(body):
	ready += 1


func _on_Area2D_body_exited(body):
	ready -= 1

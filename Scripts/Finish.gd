extends Sprite

var ready := 0

func _process(delta):
	if ready >= 2:
		Global.nextLevel()
		
		self.queue_free()


func _on_Area2D_body_entered(body):
	ready += 1


func _on_Area2D_body_exited(body):
	ready -= 1

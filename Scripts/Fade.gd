extends Control

var nextLevel := false

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'FadeOut':
		if nextLevel:
			Global.nextLevel()
		else:
			Global.gameOver()


func _on_Player1_gameOver():
	$AnimationPlayer.play("FadeOut")


func _on_Finish_nextLevel():
	$AnimationPlayer.play("FadeOut")
	nextLevel = true

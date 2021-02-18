extends KinematicBody2D

export var player_id := 1
export (NodePath) var light1_path
export (NodePath) var light2_path
export var hasKey := false

var lightValue := 1.0
var lightLossRate := 0.1
var lightGainRate := 0.5

var dead := false
var nextToHim := false

var acceleration := 2500
var max_speed := 200
var velocity := Vector2.ZERO
var friction := 0.2

var light1
var max_energy1
var light2
var max_energy2

var keyCollisionLayerBit = 2
var lockCollisionLayerBit = 3
var keyColor = Color(0.9, 0.9, 0)
var normalColor1 = Color(1, 1, 1)
var normalColor2 = Color(0.8, 0.8, 0.8)

# Called when the node enters the scene tree for the first time.
func _ready():
	light1 = get_node(light1_path)
	max_energy1 = light1.energy
	light2 = get_node(light2_path)
	max_energy2 = light2.energy


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hasKey:
		set_collision_mask_bit(keyCollisionLayerBit, 0)
		light1.color = keyColor
		light2.color = keyColor
	else:
		set_collision_mask_bit(keyCollisionLayerBit, 1)
		light1.color = normalColor1
		light2.color = normalColor2
	
	light1.energy = max_energy1 * lightValue
	light2.energy = max_energy2 * lightValue
	
	if !nextToHim:
		lightValue -= lightLossRate * delta
	else:
		lightValue += lightGainRate * delta
		if lightValue > 1.0:
			lightValue = 1.0
		
	if lightValue <= 0.3:
		Global.gameOver()
		pass
#		Kill the player
	
func _physics_process(delta):
	if dead:
		return
	
	var pl = "p" + str(player_id)
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength(pl + '_right') - Input.get_action_strength(pl + "_left")
	input_vector.y = Input.get_action_strength(pl + "_down") - Input.get_action_strength(pl + '_up')
	
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * acceleration * delta
		velocity = velocity.clamped(max_speed)
	else:
		velocity = velocity.linear_interpolate(Vector2.ZERO, friction)
		
	velocity = move_and_slide(velocity)
	
	for i in get_slide_count():
		var collider = get_slide_collision(i).get_collider()
		if collider.get_collision_layer_bit(keyCollisionLayerBit):
			if !hasKey:
				collider.queue_free()
				hasKey = true
		if collider.get_collision_layer_bit(lockCollisionLayerBit):
			if hasKey:
				collider.queue_free()
				hasKey = false
	
	
func _on_Area2D_body_entered(body):
	if body != self:
		nextToHim = true


func _on_Area2D_body_exited(body):
	if body != self:
		nextToHim = false

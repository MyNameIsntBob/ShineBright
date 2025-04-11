extends Camera2D

export (NodePath) var player1_path
export (NodePath) var player2_path



var player1

var player2

func _ready():
	player1 = get_node(player1_path)
	player2 = get_node(player2_path)

func _process(delta):
	if is_instance_valid(player1) and is_instance_valid(player2):
		self.position = (player1.global_position + player2.global_position)/2 

extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("res://scenes/player.tcsn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = player.position.x
	position.x = player.position.y
	

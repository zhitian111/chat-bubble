extends Label
func _physics_process(delta: float) -> void:
	text="已有点数："+str(game.red_points)

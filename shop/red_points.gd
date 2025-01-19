extends Label
func _physics_process(delta: float) -> void:
	text="小红点数量："+str(game.red_points)

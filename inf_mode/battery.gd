extends TextureProgressBar

# 取值9-80
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.value = 80 # 80%
	game.inf_mode_health = 80 # 80%
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.value = game.inf_mode_health # 80%
	pass

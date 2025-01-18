extends Node2D
func _ready() -> void:
	var tween=create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -100), 0.3)

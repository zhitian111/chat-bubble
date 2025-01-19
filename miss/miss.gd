extends Node2D
func _ready() -> void:
	AudioPlayer.play_sound_effect("miss")
	var tween=create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -100), 0.3)

extends Node2D
@export var bgm :AudioStream

func _physics_process(delta: float) -> void:
	AudioPlayer.play_bgm(bgm)

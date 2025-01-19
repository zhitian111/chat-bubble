extends Node2D

# 获取节点引用
@onready var particles = $GPUParticles2D
func _ready() -> void:
	AudioPlayer.play_sound_effect("red_point")
	particles.emitting = true
	
	

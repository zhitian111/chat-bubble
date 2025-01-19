extends Node2D

# 获取节点引用
@onready var particles = $GPUParticles2D
func _ready() -> void:
	particles.emitting = true

	

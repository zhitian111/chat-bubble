extends AnimationPlayer

var current_animation_index = 0
var animations = []

func _ready() -> void:
	# 获取所有动画的名称
	animations = get_animation_list()
	print(animations)
	if animations.size() > 0:
		play_next_animation()

# 播放下一个动画
func play_next_animation():
	if current_animation_index < animations.size():
		var animation_name = animations[current_animation_index]
		play(animation_name)  # 使用 play 方法来播放动画
		current_animation_index += 1
		connect("animation_finished", Callable(self, "_on_animation_finished"))
	else:
		print("所有动画播放完毕")

# 动画播放完毕时的回调函数
func _on_animation_finished(anim_name: String) -> void:
	print("动画 '" + anim_name + "' 播放完毕")
	play_next_animation()  # 播放下一个动画


func _on_timer_timeout() -> void:
	stop()

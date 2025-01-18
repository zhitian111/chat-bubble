extends AnimationPlayer

var current_animation_index = 0
var animations = []
var choice: Dictionary = {}

func _ready() -> void:
	# 获取所有动画的名称
	animations = get_animation_list()
	
	if animations.size() > 0:
		# 确保信号只连接一次
		connect("animation_finished", Callable(self, "_on_animation_finished"))
		play_next_animation()

# 播放下一个动画
func play_next_animation():
	if current_animation_index < animations.size():
		var animation_name = animations[current_animation_index]
		play(animation_name)  # 播放当前动画
		current_animation_index += 1
	else:
		print("所有动画播放完毕")

# 动画播放完毕时的回调函数
func _on_animation_finished(anim_name: String) -> void:
	print("动画 '" + anim_name + "' 播放完毕")
	play_next_animation()  # 播放下一个动画

# 接收选择结果
func _on_choose_sentence_value_chosen(count: String, chat_name: String) -> void:
	choice[chat_name] = count
	print("用户选择:", count, "聊天名称:", chat_name)

# 根据选择播放对应动画
func choose(chat_name: String, option: String, next_animation: String) -> void:
	if not choice.has(chat_name):
		print("错误: 无法找到聊天名称", chat_name)
		return
	
	if choice[chat_name] == option:
		play(next_animation)
	else:
		print("选择不匹配, 当前选择为:", choice[chat_name])

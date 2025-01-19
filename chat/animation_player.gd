extends AnimationPlayer
func play_random_animation():
	var animations = get_animation_list()  # 获取所有动画名称
	if animations.size() > 0:  # 确保有动画可以播放
		var random_animation = animations[randi() % animations.size()]  # 随机选择一个动画
		play(random_animation)  # 播放随机动画

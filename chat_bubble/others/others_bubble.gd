extends GridContainer
class_name OthersBubble
var chat_bubble = preload("res://chat_bubble/chat_bubble.tscn")

var user_name:String
func _ready() -> void:
	user_name = $name.text
# func _ready() -> void:
# 	$chat_bubble.queue_free()
# 	$placeholder.queue_free()

func set_user_name(new_name:String)->void:
	user_name = new_name
	$name.text = user_name
	if game.avatars.has(user_name):
		if game.avatars[user_name] != null:
			$avatar.texture = load(game.avatars[user_name])
	else:
		var avatar_keys = game.avatars.keys()  # 获取所有键（用户名）
		# print(avatar_keys)
		if avatar_keys.size() > 0:  # 确保有头像可以选择
			var random_key = avatar_keys[randi() % avatar_keys.size()]  # 随机选择一个键
			$avatar.texture = load(game.avatars[random_key])


func add_sentence(sentence: String) -> void:
	var bubble = chat_bubble.instantiate()
	bubble.set_text(sentence)
	self.add_child(Control.new())
	self.add_child(bubble)
	var tween = get_tree().create_tween()
	tween.tween_property(get_parent(),"position",Vector2(0,-bubble.size.y),0.3).as_relative()

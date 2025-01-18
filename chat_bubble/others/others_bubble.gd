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


func add_sentence(sentence: String) -> void:
	var bubble = chat_bubble.instantiate()
	bubble.set_text(sentence)
	self.add_child(Control.new())
	self.add_child(bubble)
	var tween = get_tree().create_tween()
	tween.tween_property(get_parent(),"position",Vector2(0,-bubble.size.y),0.3).as_relative()

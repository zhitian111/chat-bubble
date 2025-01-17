extends GridContainer
class_name MineBubble
var chat_bubble = preload("res://chat_bubble/chat_bubble.tscn")

var user_name = "me"

# func _ready() -> void:
# 	$chat_bubble.queue_free()
# 	$placeholder.queue_free()

func add_sentence(sentence: String) -> void:
	var bubble = chat_bubble.instantiate()
	bubble.set_text(sentence)
	self.add_child(bubble)
	self.add_child(Control.new())
	var tween = get_tree().create_tween()
	tween.tween_property(get_parent(),"position",Vector2(0,-bubble.size.y),0.3).as_relative()
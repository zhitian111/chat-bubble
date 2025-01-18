extends GridContainer
@onready var player = $controller
var speaker = []
signal player_end
signal new_message(message: String, poster: String)
var mine_bubble = preload("res://chat_bubble/mine/mine_bubble.tscn")
var others_bubble = preload("res://chat_bubble/others/others_bubble.tscn")
func _ready() -> void:
	$mine_bubble.queue_free()
	$others_bubble.queue_free()
	# add_sentence("Hello, how are you?", 0)
	# add_sentence("I'm fine, thanks for asking.", 1)
	$controller.play("dialog")

func add_sentence(sentence: String, poster:String) -> void:
	var tween = get_tree().create_tween()
	
	if speaker.is_empty():
		if poster == "me":
			var node = mine_bubble.instantiate()
			node.user_name = "me"

			self.add_child(Control.new())

			self.add_child(node)
			tween.tween_property(self,"position",Vector2(0,-node.get_node("avatar").size.y),0.2).as_relative()


			tween.tween_callback(node.add_sentence.bind(sentence))
			# node.add_sentence(sentence)

			speaker.append(node)
		if poster != "me":
			var node = others_bubble.instantiate()
			node.set_user_name(poster)

			self.add_child(node)
			tween.tween_property(self,"position",Vector2(0,-node.get_node("avatar").size.y),0.2).as_relative()

			
			self.add_child(Control.new())
			
			# node.add_sentence(sentence)
			tween.tween_callback(node.add_sentence.bind(sentence))

			speaker.append(node)
		return
	if poster == "me":
		if speaker[-1] is MineBubble:
			speaker[-1].add_sentence(sentence)
		if speaker[-1] is OthersBubble:
			var node = mine_bubble.instantiate()
			node.user_name = "me"

			speaker.append(node)
			
			self.add_child(Control.new())
			
			self.add_child(node)
			tween.tween_property(self,"position",Vector2(0,-node.get_node("avatar").size.y),0.2).as_relative()
			tween.tween_callback(node.add_sentence.bind(sentence))
			# node.add_sentence(sentence)
	if poster != "me":
		if speaker[-1] is OthersBubble:
			if speaker[-1].user_name == poster:
				speaker[-1].add_sentence(sentence)
			if speaker[-1].user_name != poster:
				var node = others_bubble.instantiate()
				node.set_user_name(poster)

				speaker.append(node)

				self.add_child(node)
				self.add_child(Control.new())

				tween.tween_property(self,"position",Vector2(0,-node.get_node("avatar").size.y),0.2).as_relative()
				tween.tween_callback(node.add_sentence.bind(sentence))
				return
		if speaker[-1] is MineBubble:
			
			var node = others_bubble.instantiate()
			speaker.append(node)
			node.set_user_name(poster)

			self.add_child(node)
			tween.tween_property(self,"position",Vector2(0,-node.get_node("avatar").size.y),0.2).as_relative()

			
			# node.add_sentence(sentence)
			tween.tween_callback(node.add_sentence.bind(sentence))
			
			self.add_child(Control.new())

func dialog_end() -> void:
	player_end.emit()

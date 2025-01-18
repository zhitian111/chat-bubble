extends Control

var chat = preload("res://chat/chat.tscn")
var start_position = Vector2(540,0)
var count = 0
func _ready() -> void:
	$"../Timer".start()

func create_new_chat()->void:
	var new_chat = chat.instantiate()
	new_chat.position+=start_position
	new_chat.position+=Vector2(540*count,0)
	
	new_chat.chat_name = String.num_int64(randi())

	self.add_child(new_chat)
	get_parent().dynamic_add_chat(new_chat)


func _on_timer_timeout() -> void:
	var tem = randi()%4
	if tem == 0:
		create_new_chat()
		count+=1

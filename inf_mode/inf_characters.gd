extends Control

var chat = preload("res://chat/chat.tscn")
var start_position = Vector2(540,0)
var count = 0
var probability = 0.4

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
	# for i in $"../ChatList/ChatList".get_children():
		# if i.is_shaking:
		# 	print("shake")
		# 	return
	var tem = randf_range(0,1)
	
	if tem >= probability:
		create_new_chat()
		count+=1

func _on_probability_timer_timeout() -> void:

	probability *= 0.8

	pass # Replace with function body.


func _on_range_timer_timeout() -> void:

	if game.time_range_subscript == 6:
		return

	game.time_range_subscript += 1
	# print(game.time_range_subscript)
	pass # Replace with function body.

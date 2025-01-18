extends Control

var chat = preload("res://chat/chat.tscn")
var start_position = Vector2(5400,9600)

func _ready() -> void:
	$"../Timer".start()

func create_new_chat()->void:
	var new_chat = chat.instantiate()
	new_chat.position+=start_position
	new_chat.position+=Vector2(540,0)*get_child_count()
	self.add_child(new_chat)


func _on_timer_timeout() -> void:
	var tem = randi()%4
	if tem == 0:
		create_new_chat()

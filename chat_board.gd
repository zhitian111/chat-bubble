extends Control
@export var chat=preload("res://chat_list/single_chat.tscn")
@onready var vbox=$Board/ChatList
var chats:Dictionary
func _ready() -> void:
	for i in range(0,5):
		add_chat("res://chat_list/OIP.jpg","李佳灿","哈啊哈哈哈哈哈hahahhah",5)
func add_chat(path:String,namee:String,textt:String,timee:float):
	if !chats.has(namee):
		var c=chat.instantiate()
		vbox.add_child(c)
		vbox.move_child(c, 0)
		c.init(path,namee,textt)
		chats[namee]=c
	chats[namee].set_timer(timee)
	add_point(namee)
func add_point(namee:String):
	chats[namee].set_number(chats[namee].get_number()+1)
	chats[namee].add_point()
	

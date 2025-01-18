extends Control
@export var chat = preload("res://chat_list/single_chat.tscn")
@export var miss= preload("res://miss/miss.tscn")
@onready var vbox = $ChatList
@onready var camera = $Camera2D
@onready var characters=$characters
var chats: Dictionary
var chat_objs:Dictionary={}
var cameras: Dictionary = {}
func _ready() -> void:
	camera.make_current()
	for c in characters.get_children():
		chat_objs[c.chat_name]=c
	for c in chat_objs.values():
		c.connect("all_info", Callable(self, "_on_all_info_received"))
		c.connect("back",Callable(self,"_on_chat_back"))
		c.connect("chosen",Callable(self,"chosen").bind(c))
	print(chat_objs)

func dynamic_add_chat(new_chat)->void:
	chat_objs[new_chat.chat_name] = new_chat
	new_chat.connect("all_info", Callable(self, "_on_all_info_received"))
	new_chat.connect("back",Callable(self,"_on_chat_back"))
	new_chat.connect("chosen",Callable(self,"chosen").bind(new_chat))


func _on_all_info_received(message: String, poster: String, time: int, name: String, _camera: Camera2D) -> void:
	if game.avatars.has(name):
		add_chat(game.avatars[name], name, message, float(time))
	else:
		add_chat(game.avatars["test"],name,message,float(time))
	cameras[name]=_camera
func add_chat(path: String, namee: String, textt: String, timee: float):
	# print(path)
	if !chats.has(namee):
		var c = chat.instantiate()
		vbox.add_child(c)
		vbox.move_child(c, 0)
		c.init(path, namee, textt)
		chats[namee] = c
		c.connect("chat_button_pressed", Callable(self, "_on_chat_button_pressed").bind(c))
		c.connect("time_end",Callable(self,"_on_time_end").bind(c))
	chats[namee].set_timer(timee)
	add_point(namee)
func add_point(namee: String):
	chats[namee].set_number(chats[namee].get_number() + 1)
	chats[namee].add_point()
func chosen(sender:Node):
	for key in chat_objs.keys():
		if chat_objs[key] == sender:
			print(key)
			chats[key].chosen()
func _on_chat_button_pressed(sender: Node):
	for key in chats.keys():
		if chats[key] == sender:
			cameras[key].make_current()
func _on_time_end(sender:Node):
	for key in chats.keys():
		if chats[key] == sender:
			chats[key].set_message("你已被拉黑")
	var m=miss.instantiate()
	get_tree().current_scene.add_child(m)

func _on_chat_back() -> void:
	camera.make_current()

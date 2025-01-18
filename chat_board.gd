extends Control
@export var chat = preload("res://chat_list/single_chat.tscn")
@onready var chat_obj = $chat
@onready var vbox = $Board/ChatList
@onready var camera = $Camera2D
var chats: Dictionary
var avatars: Dictionary = {
	"李佳灿": "res://chat_list/OIP.jpg",
}
var cameras: Dictionary = {}
func _ready() -> void:
	cameras["李佳灿"] = camera
	camera.make_current()
	chat_obj.connect("all_info", Callable(self, "_on_all_info_received"))
func _on_all_info_received(message: String, poster: String, time: int, name: String, camera: Camera2D) -> void:
	add_chat(avatars[name], name, message, float(time))
func add_chat(path: String, namee: String, textt: String, timee: float):
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
func _on_chat_button_pressed(sender: Node):
	print(sender.name)
	print("聊天按钮被按下")
	for key in chats.keys():
		if chats[key] == sender:
			print(cameras)
			cameras[key].make_current()
func _on_time_end(sender:Node):
	for key in chats.keys():
		if chats[key] == sender:
			print(key)

extends Control
@export var chat = preload("res://chat_list/single_chat.tscn")
@export var miss= preload("res://miss/miss.tscn")
@onready var vbox = $ChatList/ChatList
@onready var camera = $Camera2D
@onready var characters=$characters
var rating_view = preload("res://choose_sentence/rating/rating.tscn")

var chats: Dictionary
var chat_objs:Dictionary={}
var cameras: Dictionary = {}
func _ready() -> void:
	AudioPlayer.easy(true)
	game.rating_count["miss"] = 0
	game.rating_count["nice"] = 0
	game.rating_count["great"] = 0
	game.rating_count["perfect"] = 0

	game.inf_mode_health = 80

	camera.make_current()
	for c in characters.get_children():
		chat_objs[c.chat_name]=c
	for c in chat_objs.values():
		c.connect("all_info", Callable(self, "_on_all_info_received"))
		c.connect("back",Callable(self,"_on_chat_back"))
		c.connect("chosen",Callable(self,"chosen").bind(c))
	# print(chat_objs)
func dynamic_add_chat(new_chat)->void:
	chat_objs[new_chat.chat_name] = new_chat
	new_chat.connect("all_info", Callable(self, "_on_all_info_received"))
	new_chat.connect("back",Callable(self,"_on_chat_back"))
	new_chat.connect("chosen",Callable(self,"chosen").bind(new_chat))
	new_chat.connect("timer_start",Callable(self,"_on_time_start"))

func _on_all_info_received(message: String, poster: String, time: int, name: String, _camera: Camera2D) -> void:
	var avatar_keys = game.group_avatars.keys()  # 获取所有键（用户名）
	if avatar_keys.size() > 0:  # 确保 avatars 不为空	
		var random_key = avatar_keys[randi() % avatar_keys.size()]  # 随机选择一个键
		add_chat(game.group_avatars[random_key], name, message, float(time))
	cameras[name]=_camera



func add_chat(path: String, namee: String, textt: String, timee: float):

	if !chats.has(namee):
		for i in vbox.get_children():
			if i.is_shaking:	
				chat_objs[namee].queue_free()
				return
		var c = chat.instantiate()
		vbox.add_child(c)
		vbox.move_child(c, 0)
		c.init(path, namee, textt)
		chats[namee] = c
		c.connect("chat_button_pressed", Callable(self, "_on_chat_button_pressed").bind(c))
		c.connect("time_end",Callable(self,"_on_time_end").bind(c))
		chat_objs[namee].connect("tree_exited",Callable(c,"queue_free"))
		#c.shake_control_once()
	# chats[namee].set_timer(timee)
	add_point(namee)


func add_point(namee: String):
	chats[namee].set_number(chats[namee].get_number() + 1)
	chats[namee].add_point()
func chosen(sender:Node):
	for key in chat_objs.keys():
		if chat_objs[key] == sender:
			# print(key)
			chats[key].chosen()
func _on_chat_button_pressed(sender: Node):
	for key in chats.keys():
		if chats[key] == sender:
			cameras[key].make_current()
			chat_objs[key].cut_in_animation()
func _on_time_end(sender:Node):
	for key in chats.keys():
		if chats[key] == sender:
			chats[key].set_message("你已被移出群聊")
	var m=miss.instantiate()
	get_tree().current_scene.add_child(m)

func _on_chat_back() -> void:
	camera.make_current()

func _on_time_start(namee:String,timee:int):
	chats[namee].set_timer(timee)


func _on_mass_mailing_pressed() -> void:
	for i in vbox.get_children():
		if !chat_objs[i.chat_id].start_choosing_mark:
			continue
		if chat_objs[i.chat_id].chosen_mark:
			continue
		chat_objs[i.chat_id].script_chosen.connect(_on_script_chosen)
		chat_objs[i.chat_id].script_end_choosing()
		chats[i.chat_id]._on_script_pressed_button()

func _on_script_chosen(left_time:float,rating:int,chat_name:String):
	var node = rating_view.instantiate()
	if rating == 1:
		node.set_type(node.rating.nice)
	if rating == 2:
		node.set_type(node.rating.good)
	if rating == 3:
		node.set_type(node.rating.perfect)
	
	chats[chat_name].add_child(node)
	node.scale = Vector2(0.5,0.5)
	node.position = Vector2(270,100)
	node.start()
	pass



func _on_recording_timeout() -> void:
	for i in vbox.get_children():
		if !chat_objs[i.chat_id].start_choosing_mark:
			continue
		if chat_objs[i.chat_id].chosen_mark:
			continue
		if chat_objs[i.chat_id].camera.is_current():
			continue
		chat_objs[i.chat_id].script_chosen.connect(_on_script_chosen)
		chat_objs[i.chat_id].script_end_choosing()
		chats[i.chat_id]._on_script_pressed_button()
		break

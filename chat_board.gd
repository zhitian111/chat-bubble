extends Control
@export var chat=preload("res://chat_list/single_chat.tscn")
@onready var vbox=$Board/ChatList
func _ready() -> void:
	for i in range(0,5):
		var c=chat.instantiate()
		vbox.add_child(c)
		c.init("res://chat_list/OIP.jpg","ljcljc","ljcljc",5)

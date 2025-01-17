extends Control
@onready var buttons = $choose_sentence
@onready var dialogs = $dialogs

@export var chat_name = "test"

signal all_info(message:String,poster: String,time:int,name:String,camera:Camera2D)

# signal new_message(message:String,poster: String)
# signal timer_start(time:int)

var time_length = 10



func _ready():
	buttons.button_1.pressed.connect(dialogs.add_sentence.bind(buttons.text1,"me"))
	buttons.button_2.pressed.connect(dialogs.add_sentence.bind(buttons.text2,"me"))
	buttons.button_3.pressed.connect(dialogs.add_sentence.bind(buttons.text3,"me"))
	buttons.visible = false
	$dialogs.player_end.connect(start_choosing)
		

func start_choosing():
	buttons.visible = true
	var timer = get_tree().create_timer(time_length)



func _on_dialogs_new_message(message: String, poster: String) -> void:
	# new_message.emit(message,poster)
	all_info.emit(message,poster,time_length,chat_name,$Camera2D)
	pass # Replace with function body.

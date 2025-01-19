extends VBoxContainer

@onready var button_1 = $CenterContainer/Button
@onready var button_2 = $CenterContainer2/Button
@onready var button_3 = $CenterContainer3/Button
@onready var dialogs=$"../dialogs"
@onready var text1 = $CenterContainer/HBoxContainer/Label2
@onready var text2 = $CenterContainer2/HBoxContainer/Label2
@onready var text3 = $CenterContainer3/HBoxContainer/Label2
@onready var chat_name=$"..".chat_name
signal value_chosen(count:String,chat_name:String)

func set_text(choice1:String,choice2:String,choice3:String):
	text1.text=choice1
	text2.text=choice2
	text3.text=choice3


func _ready() -> void:
	button_1.pressed.connect(chosen1)
	button_2.pressed.connect(chosen2)
	button_3.pressed.connect(chosen3)
	button_1.pressed.connect(AudioPlayer.play_sound_effect.bind("dingdong"))
	button_2.pressed.connect(AudioPlayer.play_sound_effect.bind("dingdong"))
	button_3.pressed.connect(AudioPlayer.play_sound_effect.bind("dingdong"))
func chosen1() -> void:
	visible=false
	value_chosen.emit("A",chat_name)
	

func chosen2() -> void:
	visible=false

	value_chosen.emit("B",chat_name)
func chosen3() -> void:
	visible=false

	value_chosen.emit("C",chat_name)

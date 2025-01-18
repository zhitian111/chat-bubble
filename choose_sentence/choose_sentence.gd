extends VBoxContainer

@onready var button_1 = $CenterContainer/Button
@onready var button_2 = $CenterContainer2/Button
@onready var button_3 = $CenterContainer3/Button

@onready var text1 = $CenterContainer/HBoxContainer/Label2
@onready var text2 = $CenterContainer2/HBoxContainer/Label2
@onready var text3 = $CenterContainer3/HBoxContainer/Label2

signal value_chosen(count:String)

func set_text(choice1:String,choice2:String,choice3:String):
	print("set_text")
	text1.text=choice1
	text2.text=choice2
	text3.text=choice3


func _ready() -> void:
	button_1.pressed.connect(chosen)
	button_2.pressed.connect(chosen)
	button_3.pressed.connect(chosen)

func chosen() -> void:
	visible=false
	if button_1.pressed:
		value_chosen.emit("A")
	elif button_2.pressed:
		value_chosen.emit("B")
	elif button_3.pressed:
		value_chosen.emit("C")
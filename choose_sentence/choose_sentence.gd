extends VBoxContainer

@onready var button_1 = $CenterContainer/Button
@onready var button_2 = $CenterContainer2/Button
@onready var button_3 = $CenterContainer3/Button

@onready var text1 = $CenterContainer/HBoxContainer/Label2
@onready var text2 = $CenterContainer2/HBoxContainer/Label2
@onready var text3 = $CenterContainer3/HBoxContainer/Label2
func set_text(choice1:String,choice2:String,choice3:String):
	text1.text=choice1
	text2.text=choice2
	text3.text=choice3
func _ready() -> void:
	button_1.pressed.connect(chosen)
	button_2.pressed.connect(chosen)
	button_3.pressed.connect(chosen)

func chosen() -> void:
	visible=false

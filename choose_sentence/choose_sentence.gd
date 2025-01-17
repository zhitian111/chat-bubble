extends VBoxContainer

@onready var button_1 = $CenterContainer/Button
@onready var button_2 = $CenterContainer2/Button
@onready var button_3 = $CenterContainer3/Button

@onready var text1 = $CenterContainer/HBoxContainer/Label2.text
@onready var text2 = $CenterContainer2/HBoxContainer/Label2.text
@onready var text3 = $CenterContainer3/HBoxContainer/Label2.text

func _ready() -> void:
	button_1.pressed.connect(chosen)
	button_2.pressed.connect(chosen)
	button_3.pressed.connect(chosen)

func chosen() -> void:
	self.queue_free()

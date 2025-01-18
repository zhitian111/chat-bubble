extends Control
@onready var buttons = $choose_sentence
@onready var dialogs = $dialogs
@onready var header = $header
@onready var timer = $timer
@onready var progress_bar = $TextureProgressBar
@onready var camera = $Camera2D

#var parents_camera

@export var chat_name = "test"

signal all_info(message:String,poster: String,time:int,name:String,camera:Camera2D)
signal back

var done:bool = false
# signal new_message(message:String,poster: String)
# signal timer_start(time:int)

var time_length = 10



func _ready():
	buttons.button_1.pressed.connect(dialogs.add_sentence.bind(buttons.text1,"me"))
	buttons.button_2.pressed.connect(dialogs.add_sentence.bind(buttons.text2,"me"))
	buttons.button_3.pressed.connect(dialogs.add_sentence.bind(buttons.text3,"me"))
	buttons.button_1.pressed.connect(end_choosing)
	buttons.button_2.pressed.connect(end_choosing)
	buttons.button_3.pressed.connect(end_choosing)
	buttons.visible = false
	$dialogs.player_end.connect(start_choosing)
	$header.text = chat_name

	timer.wait_time = time_length

	progress_bar.visible = false

	progress_bar.max_value = time_length
	progress_bar.step = time_length/200

	#if get_parent().camera != null:
		#parents_camera = get_parent().camera


func start_choosing():
	buttons.visible = true
	progress_bar.visible = true
	timer.start()

func _process(delta: float) -> void:
	progress_bar.value = timer.time_left

func end_choosing():
	done = true
	timer.stop()



func _on_dialogs_new_message(message: String, poster: String) -> void:
	# new_message.emit(message,poster)
	all_info.emit(message,poster,time_length,chat_name,$Camera2D)
	pass # Replace with function body.


func _on_back_pressed() -> void:
	
	back.emit()
	if done:
		self.queue_free()	
	#if parents_camera:
		#parents_camera.make_current()
	

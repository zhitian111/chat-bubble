extends Control
@onready var buttons = $choose_sentence
@onready var dialogs = $dialogs
@onready var header = $header
@onready var timer = $timer
@onready var progress_bar = $TextureProgressBar
@onready var camera = $Camera2D

@onready var lose_info = $lose_inf
@onready var button_mark = $button_mark

@export var chat_name = "test"

signal all_info(message:String,poster: String,time:int,name:String,camera:Camera2D)
signal back
signal chosen

var done:bool = false

var rating = preload("res://choose_sentence/rating/rating.tscn")

@export var time_length = 10



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
	progress_bar.step = time_length/200.0

	$AnimationPlayer.play("dialog")



func start_choosing():
	buttons.visible = true
	progress_bar.visible = true
	timer.start()

func _process(delta: float) -> void:
	progress_bar.value = timer.time_left
	if !timer.is_stopped() && !done:
		progress_bar.tint_progress += delta*(Color(1,1,1,1) - Color(0, 1, 0, 0.835))/time_length

func end_choosing():
	done = true
	timer.paused = true

	chosen.emit()

	if timer.time_left * 1.0 <= 2.0/3.0*time_length:
		var rate = rating.instantiate()
		rate.set_type(rate.rating.good)
		self.add_child(rate)

		rate.start()

		rate.global_position = get_viewport().get_mouse_position() - Vector2(rate.size.x/2,rate.size.y/2)
	if timer.time_left * 1.0 > 2.0/3.0*time_length:
		var rate = rating.instantiate()
		rate.set_type(rate.rating.perfect)
		self.add_child(rate)

		rate.start()

		rate.global_position = get_viewport().get_mouse_position() - Vector2(rate.size.x/2,rate.size.y/2)

func _on_dialogs_new_message(message: String, poster: String) -> void:

	all_info.emit(message,poster,time_length,chat_name,$Camera2D)


func _on_back_pressed() -> void:
	
	back.emit()


	


func _on_timer_timeout() -> void:

	var tween = get_tree().create_tween()

	tween.tween_property(lose_info,"position",Vector2(0,-lose_info.size.y),0.3).as_relative()
	tween.parallel()
	tween.tween_property(dialogs,"position",Vector2(0,-lose_info.size.y),0.3).as_relative()

	var rate = rating.instantiate()
	rate.set_type(rate.rating.bad)
	self.add_child(rate)

	rate.start()

	rate.global_position = button_mark.global_position - Vector2(rate.size.x/2,rate.size.y/2)

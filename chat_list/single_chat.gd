extends Control
@onready var avatar = $HBoxContainer/avatar
@onready var chat_name = $HBoxContainer/VBoxContainer/name
@onready var message = $HBoxContainer/VBoxContainer/message
@onready var time = $TimerBox/time
@onready var red_point=$HBoxContainer/avatar/Sprite2D
@onready var red_point_num=$HBoxContainer/avatar/Sprite2D/Label
@onready var timer_box=$TimerBox
var chat_id
var timer: Timer
var number:int=0
signal chat_button_pressed
signal time_end
func _ready() -> void:
	red_point.visible=false
	red_point_num.visible=false
	timer = Timer.new()
	add_child(timer)
	timer.set_wait_time(5)
	$TimerBox/time.text = ""
func init(path: String, aname: String, amessage: String) -> void:
	avatar.texture = load(path)
	var group_names = [
		"代码吧少年",
		"秃头研究协会",
		"今天也要努力划水",
		"吃饭睡觉打代码",
		"闲聊不如赚钱",
		"复读机选手俱乐部",
		"摸鱼摸到海底",
		"卷不动也得卷",
		"键盘侠终极联盟",
		"改Bug第一天"
	]
	randomize()  # 确保随机性
	var random_name = group_names[randi() % group_names.size()]
	chat_name.text = random_name
	if amessage.length() > 7:
		amessage = amessage.substr(0, 7) + "..."  # 超过部分显示省略号
	message.text = amessage
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	chat_id = aname
func set_message(amessage:String):
	message.text = amessage
func set_timer(atime: float=5):
	timer.stop()
	timer.set_wait_time(atime)
	timer.start()
	timer_box.visible=true
func _on_timer_timeout() -> void:
	emit_signal("time_end")
	timer_box.visible=false
	timer.stop()

# 更新剩余时间
func _process(_delta: float) -> void:
	if !timer.is_stopped():
		time.text = "剩余时间：\n" + str(int(timer.time_left))


func _on_button_button_down() -> void:
	game.red_points+=number
	number=0
	red_point.visible=false
	red_point_num.visible=false
	emit_signal("chat_button_pressed")

func _on_script_pressed_button()->void:
	number=0
	red_point.visible=false
	red_point_num.visible=false

func add_point():
	red_point.visible=true
	red_point_num.visible=true
	red_point_num.text=var_to_str(number)
func set_number(num:int):
	number=num
func get_number():
	return number;
func chosen():
	timer.stop()
	timer_box.visible=false

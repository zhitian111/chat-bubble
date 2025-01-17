extends Control
@onready var avatar = $HBoxContainer/avatar
@onready var chat_name = $HBoxContainer/VBoxContainer/name
@onready var message = $HBoxContainer/VBoxContainer/message
@onready var time = $HBoxContainer/VBoxContainer2/time
var timer: Timer
func _ready() -> void:
	timer = Timer.new()
	timer.set_wait_time(5)
func init(path: String, aname: String, amessage: String, atime: float=5) -> void:
	# 动态创建并添加 Timer
	add_child(timer)
	timer.set_wait_time(atime)
	timer.start()
	avatar.texture = load(path)
	chat_name.text = aname
	message.text = amessage
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

func _on_timer_timeout() -> void:
	print("定时器结束")

# 更新剩余时间
func _process(_delta: float) -> void:
	time.text = "剩余时间：" + str(timer.time_left)


func _on_button_button_down() -> void:
	pass

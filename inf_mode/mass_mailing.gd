extends Button

var working:bool = false
var cding:bool = false

var working_time_length:float = 0.1
var cd_time_length:float = 5.0

func _ready() -> void:
	$Timer.wait_time = working_time_length
	$cd_timer.wait_time = cd_time_length
	# $time.visible = false

func _on_pressed() -> void:
	if working:
		return
	if cding:
		return
	$Timer.start()
	working = true
	pass
func _process(delta: float) -> void:
	if working:
		# $time.text = "剩余:\n" + str(int($Timer.time_left)) + "\n秒"
		self.self_modulate += (Color(0.251, 0.251, 0.251) - Color(1,1,1,1))/working_time_length * delta
	if cding:
		self.self_modulate += (Color(1,1,1,1) - Color(0.251, 0.251, 0.251))/cd_time_length * delta

func _on_timer_timeout() -> void:
	cding = true
	working = false
	self_modulate = Color(0.251, 0.251, 0.251)
	$Timer.stop()
	$cd_timer.start()

func _on_cd_timer_timeout() -> void:
	$cd_timer.stop()
	cding = false
	pass # Replace with function body.

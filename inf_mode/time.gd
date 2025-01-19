extends Label

var has_point:bool = true

func _ready() -> void:
	$Timer.start()
	var date_time = Time.get_datetime_dict_from_system()
	var hour = str(date_time["hour"])
	if date_time["hour"] < 10:
		hour = "0" + str(date_time["hour"])
	var minute = str(date_time["minute"])
	if date_time["minute"] < 10:
		minute = "0" + str(date_time["minute"])
	if has_point:
		
		text = hour + " : " + minute 

	if !has_point:
		text = hour + "   " + minute
	has_point = !has_point		
func _on_timer_timeout() -> void:

	var date_time = Time.get_datetime_dict_from_system()
	var hour = str(date_time["hour"])
	if date_time["hour"] < 10:
		hour = "0" + str(date_time["hour"])
	var minute = str(date_time["minute"])
	if date_time["minute"] < 10:
		minute = "0" + str(date_time["minute"])

	if has_point:
		
		text = hour + " : " + minute 

	if !has_point:
		text = hour + "   " + minute
	has_point = !has_point
	pass # Replace with function body.

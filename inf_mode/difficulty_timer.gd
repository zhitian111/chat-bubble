extends Timer

func _on_timeout() -> void:

	get_parent().stop()
	get_parent().wait_time *= 0.8
	get_parent().start()
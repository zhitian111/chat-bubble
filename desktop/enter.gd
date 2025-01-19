extends Button


func _on_button_down() -> void:
	get_tree().change_scene_to_file("res://inf_mode/inf_mode_chat_board.tscn")

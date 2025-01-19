extends Button


func _on_button_down() -> void:

	AudioPlayer.play_sound_effect("switch_press")
	get_tree().change_scene_to_file("res://inf_mode/inf_mode_chat_board.tscn")
func _on_wrong_pressed() -> void:

	AudioPlayer.play_sound_effect("switch_press")
	get_tree().change_scene_to_file("res://contributer/contributer.tscn")
func _on_mouse_entered() -> void:
	AudioPlayer.play_sound_effect("switch_choose")

func _on_shop_mouse_entered() -> void:
	AudioPlayer.play_sound_effect("switch_choose")



func _on_button_pressed_sound() -> void:
	AudioPlayer.play_sound_effect("switch_press")

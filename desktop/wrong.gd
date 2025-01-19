extends Button

func _on_button_down() -> void:
	AudioPlayer.play_sound_effect("switch_press")
	get_tree().change_scene_to_file("res://desktop/blue.tscn")

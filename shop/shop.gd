extends Node2D


func _on_group_reply_button_down() -> void:
	if game.red_points >= 100:
		if !game.group_reply:
			game.group_reply = true
			game.red_points -= 100
	else:
		print("not enough red_points")

		
func _on_auto_reply_button_down() -> void:
	if game.red_points >= 100:
		if !game.auto_reply:
			game.auto_reply = true
			game.red_points -= 100
	else:
		print("not enough red_points")


func _on_back_button_down() -> void:
	get_tree().change_scene_to_file("res://desktop/desktop.tscn")

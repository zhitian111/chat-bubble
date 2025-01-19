extends Node2D
@onready var gbutton=$group_reply
@onready var abutton=$auto_reply

func _on_group_reply_button_down() -> void:
	if game.group_reply:
		gbutton.disabled=true
		gbutton.text="已安装"
	else:
		if game.red_points >= 100:
			game.group_reply = true
			game.red_points -= 100
		# else:
			# print("not enough red_points")

		
func _on_auto_reply_button_down() -> void:
	if game.auto_reply:
		abutton.disabled=true
		abutton.text="已安装"
	else:
		if game.red_points >= 100:
			game.auto_reply = true
			game.red_points -= 100
		# else:
			# print("not enough red_points")


func _on_back_button_down() -> void:
	get_tree().change_scene_to_file("res://desktop/desktop.tscn")

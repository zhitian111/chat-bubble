extends Node2D

var can_back:bool = false
func _ready() -> void:
	AudioPlayer.stop()
func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://desktop/desktop.tscn")
	AudioPlayer.play()
	# print("重启")
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed && can_back:
			_on_button_button_down()

func end_animation():
	can_back = true
func sound():
	AudioPlayer.play_sound_effect("error")

extends Control

func _ready() -> void:
	var tween = get_tree().create_tween()
	self.modulate = Color(1,1,1,0)
	tween.tween_property(self,"modulate",Color(1,1,1,1),0.5)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			get_tree().change_scene_to_file("res://desktop/desktop.tscn")
extends Label

func _ready() -> void:
	self.modulate = Color(1,1,1,0)
	var tween = get_tree().create_tween()
	tween.tween_property(self,"modulate",Color(1,1,1,1),0.3)
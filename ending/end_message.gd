extends Node2D
var used:bool=false
func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	if !used:
		if game.finish_l&&game.finish_w:
			global_position.y+=200
			used=true
func _on_button_button_down() -> void:
	if game.bad_ending:
		get_tree().change_scene_to_file("res://ending/bad_ending.tscn")
	elif game.good_ending:
		get_tree().change_scene_to_file("res://ending/good_ending.tscn")
	elif game.peace_ending:
		get_tree().change_scene_to_file("res://ending/peace_ending.tscn")

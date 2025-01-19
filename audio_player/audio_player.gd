extends Node

@onready var sound_effect = $SE
@onready var bgm_player = $BGM/BGMPlayer
@onready var bgm_player_easy=$BGM/BGMPlayer2
@onready var bgm_player_4=$BGM/BGMPlayer3
enum BUSS{
	master,
	bgm,
	sfx
};
func _ready() -> void:
	bgm_player.play()
	bgm_player_easy.play()
	bgm_player_easy.volume_db=-80
func easy(a:bool):
	var tween = get_tree().create_tween()
	if	a:
		tween.tween_property(bgm_player, "volume_db", -80,0.2)
		tween.parallel()
		tween.tween_property(bgm_player_easy, "volume_db", 0,0.2)
	else:
		tween.tween_property(bgm_player_easy, "volume_db", -80,0.2)
		tween.parallel()
		tween.tween_property(bgm_player, "volume_db", 0,0.2)
func stop():
	bgm_player.stop()
	bgm_player_easy.stop()
func play():
	bgm_player.play()
	bgm_player_easy.play()
func play_end():
	bgm_player_4.play()
func stop_end():
	bgm_player_4.stop()

func play_sound_effect(sound_effect_name:String):
	var audio = sound_effect.get_node(sound_effect_name) as AudioStreamPlayer
	if audio == null:
		return
	# audio.volume_db = (1 - sound_effect_level * main_sound_level) * sound_offset
	#if audio.playing == true:
		#return
	audio.play(0)

func play_bgm(bgm:AudioStream):
	bgm_player.play()

# func change_to_menu():
# 	var tween = get_tree().create_tween()
# 	tween.tween_property(menu, "volume_db", 0,0.2)
# 	tween.tween_property(bgm_player, "volume_db", -80,1)

# func change_to_game():
# 	var tween = get_tree().create_tween()
# 	tween.tween_property(bgm_player, "volume_db", 0,0.2)
# 	tween.tween_property(menu, "volume_db", -80,1)

# func play_menu_bgm(bgm:AudioStream):

# 	if menu.playing == true && menu.stream == bgm:
# 		return
# 	if bgm == null:
# 		return
# 	if menu.stream != bgm:
# 		menu.stream = bgm
# 	# bgm_player.volume_db = (1 - bgm_sound_level * main_sound_level) * sound_offset
# 	menu.play()


func button_se_init(node:Node):
	for i in node.get_children():
		button_se_init(i)
	var button = node as Button
	if button == null:
		return
	button.pressed.connect(play_sound_effect.bind("button_pressed"))
	button.focus_entered.connect(play_sound_effect.bind("button_focused"))
	button.mouse_entered.connect(play_sound_effect.bind("button_hovered"))


func get_bus_volume(bus_index:int) -> float:
	var db := AudioServer.get_bus_volume_db(bus_index)
	var volume := db_to_linear(db)
	return volume

func set_bus_volume(bus_index:int, volume:float):
	var db := linear_to_db(volume)
	AudioServer.set_bus_volume_db(bus_index, db)


func stop_sound_effect(sound_effect_name:String):
	var audio = sound_effect.get_node(sound_effect_name) as AudioStreamPlayer
	if audio == null:
		return
	if audio.playing == true:
		audio.stop()
	audio.seek(0)

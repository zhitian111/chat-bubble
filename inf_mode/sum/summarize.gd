extends Control

@onready var great_label = $great/count
@onready var nice_label = $nice/count
@onready var miss_label = $miss/count
@onready var perfect_label = $perfect/count
@onready var red_label = $red/count

var great_count = 0
var nice_count = 0
var miss_count = 0
var perfect_count = 0
var red_count = 0

func show_great_label()->void:
	great_count	= 0

	var tween = get_tree().create_tween()

	great_label.visible = true

	great_label.modulate = Color(1,1,1,0)

	tween.tween_property(great_label,"modulate",Color(1,1,1,1),0.5)

	tween.tween_property(self,"great_count",game.rating_count["great"],0.5)


func show_nice_label()->void:
	nice_count	= 0

	var tween = get_tree().create_tween()

	nice_label.visible = true

	nice_label.modulate = Color(1,1,1,0)
	tween.tween_property(nice_label,"modulate",Color(1,1,1,1),0.5)

	tween.tween_property(self,"nice_count",game.rating_count["nice"],0.5)

func show_miss_label()->void:
	miss_count	= 0

	var tween = get_tree().create_tween()
	
	miss_label.visible = true

	miss_label.modulate = Color(1,1,1,0)
	tween.tween_property(miss_label,"modulate",Color(1,1,1,1),0.5)

	tween.tween_property(self,"miss_count",game.rating_count["miss"],0.5)

func show_perfect_label()->void:
	perfect_count = 0

	var tween = get_tree().create_tween()
	
	perfect_label.visible = true
	
	perfect_label.modulate = Color(1,1,1,0)
	tween.tween_property(perfect_label,"modulate",Color(1,1,1,1),0.5)

	tween.tween_property(self,"perfect_count",game.rating_count["perfect"],0.5)

func show_red_label():
	red_count = 0

	var tween = get_tree().create_tween()

	red_label.modulate = Color(1,1,1,0)

	tween.tween_property(red_label,"modulate",Color(1,1,1,1),0.5)

	tween.tween_property(self,"red_count",game.red_points,0.5)


	red_label.visible = true



func _process(delta: float) -> void:
	great_label.text = "Great: " + str(great_count)
	nice_label.text = "Nice: " + str(nice_count)
	miss_label.text = "Miss: " + str(miss_count)
	perfect_label.text = "Perfect: " + str(perfect_count)
	red_label.text = "消除红点: " + str(red_count)

func _ready() -> void:
	great_label.visible = false
	nice_label.visible = false
	miss_label.visible = false
	perfect_label.visible = false
	red_label.visible = false
	$AnimationPlayer.play("end")

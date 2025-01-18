extends CenterContainer

@onready var perfect_texture = $perfect
@onready var good_texture = $good
@onready var bad_texture = $bad
@onready var timer = $Timer

enum rating{
	good,
	bad,
	perfect
}

var speed = 100.0
var is_started = false


@export var type: rating = rating.good

func set_type(new_type: rating)->void:
	type = new_type

func start()->void:
	if type == rating.good:
		good_texture.show()
		perfect_texture.queue_free()
		bad_texture.queue_free()
	if type == rating.bad:
		bad_texture.show()
		good_texture.queue_free()
		perfect_texture.queue_free()
	if type == rating.perfect:
		perfect_texture.show()
		good_texture.queue_free()
		bad_texture.queue_free()
	is_started = true
	timer.start()


func _process(delta: float) -> void:
	if is_started:
		self.position.y -= speed * delta
	

func _on_timer_timeout() -> void:
	self.queue_free()
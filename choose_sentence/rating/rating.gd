extends CenterContainer

@onready var perfect_texture = $perfect
@onready var good_texture = $good
@onready var bad_texture = $bad
@onready var nice_texture = $nice
@onready var timer = $Timer

enum rating{
	good,
	bad,
	perfect,
	nice
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
		nice_texture.queue_free()
		game.rating_count["great"]+=1
	if type == rating.bad:
		bad_texture.show()
		good_texture.queue_free()
		perfect_texture.queue_free()
		nice_texture.queue_free()
		game.rating_count["miss"]+=1
	if type == rating.perfect:
		perfect_texture.show()
		good_texture.queue_free()
		bad_texture.queue_free()
		nice_texture.queue_free()
		game.rating_count["perfect"]+=1
	if type == rating.nice:
		nice_texture.show()
		good_texture.queue_free()
		bad_texture.queue_free()
		perfect_texture.queue_free()
		game.rating_count["nice"]+=1

	is_started = true
	timer.start()


func _process(delta: float) -> void:
	if is_started:
		self.position.y -= speed * delta
	

func _on_timer_timeout() -> void:
	self.queue_free()
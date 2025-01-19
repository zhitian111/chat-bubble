extends Node
var chat: Dictionary
var avatars: Dictionary = {
	"test": "res://assets/avatar/1.png",
	"游戏开黑群": "res://assets/avatar/2.png",
	"情人": "res://assets/avatar/3.png",
	"妻子": "res://assets/avatar/1.png",
	"random1": "res://assets/avatar/4.png",
	"random2": "res://assets/avatar/5.png",
	"random3": "res://assets/avatar/6.png",
	"random4": "res://assets/avatar/7.png",
	"random5": "res://assets/avatar/8.jpg",
	"random6": "res://assets/avatar/9.jpg",
	"random7": "res://assets/avatar/10.png",
}
var group_avatars = {
	"random1": "res://assets/avatar/group/1.png",
	"random2": "res://assets/avatar/group/2.jpg",
	"random3": "res://assets/avatar/group/3.png",
	"random4": "res://assets/avatar/group/4.png",
	"random5": "res://assets/avatar/group/5.jpg",
	"random6": "res://assets/avatar/group/6.jpg",
	"random7": "res://assets/avatar/group/7.jpg",
}
var choice: Dictionary = {
	"游戏开黑群": "D",
	"情人": "D",
	"妻子": "D"
}


var rating_count = {
	"perfect": 0,
	"great": 0,
	"nice": 0,
	"miss": 0
}

var inf_mode_health = 89.0
var red_points: int = 100
var group_reply: bool = false
var auto_reply: bool = false


var time_range_subscript = 0
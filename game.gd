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
	"random5": "res://assets/avatar/8.png",
	"random6": "res://assets/avatar/9.png",
	"random7": "res://assets/avatar/10.png",
}
var choice: Dictionary = {
	"游戏开黑群": "D",
	"情人": "D",
	"妻子": "D"
}


var rating_count = {
	"perfect":0,
	"great":0,
	"nice":0,
	"miss":0
}
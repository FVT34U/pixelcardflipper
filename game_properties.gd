extends Node

var size = 30
var width = 6

var num_of_cards_to_open = 2
var card_stacks = 0


func _ready():
	card_stacks = size / num_of_cards_to_open

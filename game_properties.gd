extends Node

var size = 100
var width = 10

var num_of_cards_to_open = 2
var card_stacks = 0


func _ready():
	card_stacks = size / num_of_cards_to_open

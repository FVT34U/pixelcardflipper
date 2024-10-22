extends Node
class_name GameController

@export var time = 60
@export var timer: Timer
@export var sec_timer: Timer

@export var ui: UIController

var chosen_cards: Array[Card] = []
var possible_ids: Array[int] = []

signal time_changed(time_remain: int)


func get_random_id() -> int:
	var id = possible_ids.pick_random()
	possible_ids.erase(id)
	
	return id


func generate_random_ids():
	for i in range(GameProperties.card_stacks):
		for j in range(GameProperties.num_of_cards_to_open):
			possible_ids.append(i)


func _ready():
	ui.ui_is_ready.connect(_on_ui_is_ready)
	
	generate_random_ids()


func _on_card_choosed(card: Card):
	print(card.id)
	
	if chosen_cards.size() < GameProperties.num_of_cards_to_open - 1:
		chosen_cards.append(card)
		return
	
	chosen_cards.append(card)
	
	var primary_id = chosen_cards[0].id
	var failed = false
	
	for c in chosen_cards:
		if c.id != primary_id:
			failed = true
	
	if not failed:
		for c in chosen_cards:
			c.disabled = true
	
	chosen_cards.clear()


func _on_ui_is_ready():
	time_changed.emit(time - 1)
	timer.start(time)
	sec_timer.start(1)


func _on_level_timer_timeout():
	print("game over")
	sec_timer.autostart = false


func _on_seconds_timer_timeout():
	time_changed.emit(timer.get_time_left())

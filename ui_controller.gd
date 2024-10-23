extends Control
class_name UIController


@export var game_controller: GameController

@onready var card_scene = preload("res://Card.tscn")

signal ui_is_ready


func _ready():
	game_controller.time_changed.connect(_on_time_changed)
	
	%Grid.columns = GameProperties.width
	
	for __ in range(GameProperties.size):
		var card = card_scene.instantiate()
		card.id = game_controller.get_random_id()
		# Debug
		card.set_text(str(card.id))
		
		card.card_choosed.connect(game_controller._on_card_choosed)
		
		%Grid.add_child(card)
	
	ui_is_ready.emit()


func _on_time_changed(time_remain: int):
	var m = str(time_remain / 60)
	var s = str(time_remain % 60)
	
	var minutes = m if m.length() > 1 else "0" + m
	var seconds = s if s.length() > 1 else "0" + s
	
	%Minutes.set_text(minutes)
	%Seconds.set_text(seconds)


func _on_btn_back_pressed() -> void:
	get_tree().quit()

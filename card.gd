extends Button
class_name Card

@export var id: int
@export var anim_player: AnimationPlayer

signal card_choosed(card: Card)


func _on_pressed():
	card_choosed.emit(self)

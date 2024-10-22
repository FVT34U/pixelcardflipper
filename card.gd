extends Button
class_name Card

@export var id: int
@export var anim_player: AnimationPlayer

signal card_choosed(card: Card)


func _ready() -> void:
	_set_size(Vector2(get_size().x, get_size().x))


func _on_pressed():
	card_choosed.emit(self)

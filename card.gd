extends Button
class_name Card

@export var id: int
@export var anim_player: AnimationPlayer

signal card_choosed(card: Card)


func _ready() -> void:
	await get_tree().create_timer(1).timeout
	pivot_offset = size / 2
	print(rotation)
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, 'rotation', deg_to_rad(90), 1.0)
	tween.set_parallel()
	tween.tween_property(self, 'global_position', global_position + Vector2(10, 10), 1.0)


func _on_pressed():
	card_choosed.emit(self)

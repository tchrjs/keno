extends Node

signal credits_updated(credits: int)

var credits: int = 1000

func _ready() -> void:
	emit_signal("credits_updated", credits)

func add_credits(_credits: int) -> void:
	credits += _credits
	emit_signal("credits_updated", credits)

func remove_credits(_credits: int) -> bool:
	if credits - _credits >= 0:
		credits -= _credits
		emit_signal("credits_updated", credits)
		return true
	else:
		return false

func get_credits() -> int:
	return credits

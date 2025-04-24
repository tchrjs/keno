class_name HitCounter extends Control

@export var board: Board
@export var hits_label: Label

func _ready() -> void:
	board.connect("hit_count_updated", update)

func update(hits: int) -> void:
	hits_label.text = str(hits)

func reset() -> void:
	hits_label.text = "0"

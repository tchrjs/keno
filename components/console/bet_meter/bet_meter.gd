class_name BetMeter extends Control

@export var credits: Label
var bet_level: int

func _ready() -> void:
	update(1)

func update(_bet_level: int) -> void:
	bet_level = _bet_level
	credits.text = str(int(MathEngine.bet_levels[bet_level - 1]))

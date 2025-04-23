class_name BetMeter extends Control

signal bet_updated

@export var credits: Label
@export var minus_button: MinusButton
@export var plus_button: PlusButton

func _ready() -> void:
	update()

func update() -> void:
	credits.text = str(MathEngine.get_current_bet_credits())
	emit_signal("bet_updated")

func decrement_bet_level() -> void:
	MathEngine.decrement_bet_level()
	update()

func increment_bet_level() -> void:
	MathEngine.increment_bet_level()
	update()

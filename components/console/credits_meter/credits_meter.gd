class_name CreditsMeter extends Control

@export var credits: Label

func _init() -> void:
	Platform.connect("credits_updated", update)

func update(_credits: int) -> void:
	credits.text = str(_credits)

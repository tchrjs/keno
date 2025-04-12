class_name Dashboard extends Control

signal draw_pressed

@export var board: Board
@export var clear_button: Button
@export var draw_button: Button

func disable_all() -> void:
	clear_button.disabled = true
	draw_button.disabled = true

func enable_all() -> void:
	clear_button.disabled = false
	draw_button.disabled = false

func _on_clear_button_pressed() -> void:
	board.clear()

func _on_draw_button_pressed() -> void:
	disable_all()
	emit_signal("draw_pressed")

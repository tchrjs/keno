class_name Dashboard extends Control

@export var board: Board
@export var clear_button: Button
@export var play_button: PlayButton

func disable_all() -> void:
	clear_button.disabled = true
	play_button.disabled = true

func enable_all() -> void:
	clear_button.disabled = false
	play_button.disabled = false

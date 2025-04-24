class_name PauseMenu extends Control

@export var game: Game
@export var resume_button: Button

func _on_resume_button_pressed() -> void:
	game.toggle_pause()

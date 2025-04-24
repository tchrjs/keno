class_name Game extends Node

@export var game_content: GameContent
@export var pause_menu: PauseMenu

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("game_pause"):
		pause_menu.visible = !pause_menu.visible
		get_tree().paused = pause_menu.visible

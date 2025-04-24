class_name Game extends Node

@export var game_content: GameContent
@export var pause_menu: PauseMenu

func _ready() -> void:
	game_content.console.menu_button.connect("pressed", toggle_pause)

func toggle_pause() -> void:
	pause_menu.visible = !pause_menu.visible
	get_tree().paused = pause_menu.visible
	if game_content.state_machine.get_current_state_name() == "idle":
		game_content.console.toggle(true)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("game_pause"):
		toggle_pause()

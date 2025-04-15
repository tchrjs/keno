class_name Console extends Control

@export var state_machine: StateMachine
@export var board: Board

@export var clear_button: ClearButton
@export var play_button: PlayButton

func _ready() -> void:
	clear_button.state_machine = state_machine
	play_button.state_machine = state_machine
	clear_button.board = board
	play_button.board = board
	board.connect("marked_spots_updated", toggle.bind(true))


func toggle(toggled_on: bool) -> void:
	clear_button.toggle(toggled_on)
	play_button.toggle(toggled_on)

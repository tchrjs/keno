class_name Console extends Control

@export var state_machine: StateMachine
@export var board: Board

@export var menu_button: Button
@export var clear_button: ClearButton
@export var play_button: PlayButton
@export var bet_meter: BetMeter

func _ready() -> void:
	# Attach nodes.
	clear_button.state_machine = state_machine
	play_button.state_machine = state_machine
	bet_meter.minus_button.state_machine = state_machine
	bet_meter.plus_button.state_machine = state_machine
	clear_button.board = board
	play_button.board = board

	# Connect signals.
	board.connect("marked_spots_updated", toggle.bind(true))
	bet_meter.connect("bet_updated", toggle.bind(true))

func toggle(toggled_on: bool) -> void:
	clear_button.toggle(toggled_on)
	play_button.toggle(toggled_on)
	bet_meter.minus_button.toggle(toggled_on)
	bet_meter.plus_button.toggle(toggled_on)

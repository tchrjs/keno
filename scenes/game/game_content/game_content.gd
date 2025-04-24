class_name GameContent extends Node

@export var state_machine: StateMachine

@export var board: Board
@export var payouts: Payouts
@export var console: Console
@export var info_bar: InfoBar

# Connect signals to children, then start up game.
func _ready() -> void:
	board.connect("marked_spots_updated", reset)
	console.bet_meter.connect("bet_updated", reset)
	console.play_button.connect("play_pressed", reset)
	state_machine.enter_initial_state()

func reset() -> void:
	board.reset()
	payouts.reset()
	payouts.update()
	info_bar.update()

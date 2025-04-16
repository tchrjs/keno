class_name Game extends Node

@export var state_machine: StateMachine
@export var board: Board
@export var payouts: Payouts

# Connect signals to children, then start up game.
func _ready() -> void:
	state_machine.enter_initial_state()

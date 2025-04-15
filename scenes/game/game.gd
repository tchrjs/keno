class_name Game extends Node

@export var state_machine: StateMachine

# Connect signals to children, then start up game.
func _ready() -> void:
	state_machine.enter_initial_state()

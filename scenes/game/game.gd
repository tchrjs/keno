class_name Game extends Node

@export var state_machine: StateMachine

func _ready() -> void:
	state_machine.enter_initial_state()

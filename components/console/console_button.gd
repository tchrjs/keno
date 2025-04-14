class_name ConsoleButton extends Button

var state_machine: StateMachine

func toggle(toggled_on: bool) -> void:
	if state_machine and state_machine.current_state:
		match state_machine.current_state.name.to_lower():
			"idle": _idle(toggled_on)
			"play": _play(toggled_on)

func _idle(_toggled_on: bool) -> void:
	pass

func _play(_toggled_on: bool) -> void:
	pass

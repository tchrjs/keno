class_name ConsoleButton extends Button

var state_machine: StateMachine

func toggle(toggled_on: bool) -> void:
	if state_machine and state_machine.current_state:
		match state_machine.current_state.name.to_lower():
			"idle": _toggled_idle(toggled_on)
			"play": _toggled_play(toggled_on)

func _toggled_idle(toggled_on: bool) -> void:
	disabled = !toggled_on

func _toggled_play(toggled_on: bool) -> void:
	disabled = !toggled_on

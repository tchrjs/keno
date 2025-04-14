class_name PlayButton extends ConsoleButton

signal play_pressed
signal stop_pressed

@export var board: Board

var is_stop: bool = false

func toggle_stop(toggled_on: bool) -> void:
	is_stop = toggled_on
	text = "Stop" if toggled_on else "Draw"

func _idle(_toggled_on: bool) -> void:
	disabled = !_toggled_on || board.marked_spots.size() < MathEngine.min_pick

func _play(_toggled_on: bool) -> void:
	disabled = !_toggled_on

func _pressed():
	toggle(false)
	if is_stop:
		emit_signal("stop_pressed")
	else:
		emit_signal("play_pressed")

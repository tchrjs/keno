class_name ClearButton extends ConsoleButton

var board: Board

func _toggled_idle(toggled_on: bool) -> void:
	disabled = !toggled_on || board.marked_spots.size() <= 0

func _toggled_play(_toggled_on: bool) -> void:
	disabled = true

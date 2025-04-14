class_name ClearButton extends ConsoleButton

@export var board: Board

func _idle(toggled_on: bool) -> void:
	disabled = !toggled_on || board.marked_spots.size() <= 0

func _play(_toggled_on: bool) -> void:
	disabled = true

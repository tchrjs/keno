class_name Play extends State

@export var board: Board

func _init() -> void:
	pass

func enter() -> void:
	var picked_numbers: Array[int] = []
	for spot in board.marked_spots:
		picked_numbers.append(spot.number)
	MathEngine.draw(picked_numbers)

func exit() -> void:
	pass

extends Node

@export var paytable: JSON

# Engine variables.
var unpicked_numbers: Array[int] = []

func get_draw(picked_numbers: Array[int]) -> Result:
	_reset()

	# Get results.
	var result: Result = Result.new()
	var drawn_numbers: Array[int] = _draw(MathEngine.draw_number)

	# Set draw results.
	result.drawn_numbers = drawn_numbers
	result.picked_numbers = picked_numbers
	result.credits_won = 0
	return result

func get_bet_levels() -> Array:
	return paytable.data["BetLevels"]

func get_payouts() -> Array:
	return paytable.data["Payouts"]

func _reset() -> void:
	unpicked_numbers = []
	for i in range(1, MathEngine.pool_size + 1):
		unpicked_numbers.append(i)

func _draw(draw_number: int) -> Array[int]:
	var drawn_numbers: Array[int] = []
	for i in MathEngine.draw_number:
		var picked_index: int = randi_range(0, unpicked_numbers.size() - 1)
		drawn_numbers.append(unpicked_numbers[picked_index])
		unpicked_numbers.remove_at(picked_index)
	return drawn_numbers

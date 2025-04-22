class_name KenoEngine extends Node

@export var paytable: JSON

# Engine variables.
var unpicked_numbers: Array[int] = []

var result: Result

func get_draw(picked_numbers: Array[int], bet_level: int) -> Result:
	Platform.remove_credits(get_bet_levels()[bet_level - 1])
	_reset()

	# Get results.
	result = Result.new()
	var drawn_numbers: Array[int] = _draw(MathEngine.draw_number)

	# Set draw results.
	result.drawn_numbers = drawn_numbers
	result.picked_numbers = picked_numbers

	# Find credits won.
	result.picked_count = picked_numbers.size()
	result.matched_count = 0
	for number: int in result.drawn_numbers:
		if number in result.picked_numbers:
			result.matched_count += 1
	result.credits_won = paytable.data["Payouts"][result.picked_count][result.matched_count]
	return result

func draw_completed() -> void:
	Platform.add_credits(result.credits_won)

func get_bet_levels() -> Array:
	return paytable.data["BetLevels"]

func get_payouts() -> Array:
	return paytable.data["Payouts"]

func _reset() -> void:
	unpicked_numbers = []
	for i: int in range(1, MathEngine.pool_size + 1):
		unpicked_numbers.append(i)

func _draw(draw_number: int) -> Array[int]:
	var drawn_numbers: Array[int] = []
	for i: int in MathEngine.draw_number:
		var picked_index: int = randi_range(0, unpicked_numbers.size() - 1)
		drawn_numbers.append(unpicked_numbers[picked_index])
		unpicked_numbers.remove_at(picked_index)
	return drawn_numbers

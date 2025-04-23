extends Node

@export var keno_engine: KenoEngine

@export_subgroup("Game Config")
@export var min_pick: int = 2
@export var max_pick: int = 10
@export var draw_number: int = 20
@export var pool_size: int = 80

var bet_levels: Array
var current_bet_level: int = 1
var payouts: Dictionary


var drawn_numbers: Array[int]
var picked_numbers: Array[int]
var credits_won: int
var picked_count: int
var matched_count: int

func _ready() -> void:
	bet_levels = keno_engine.get_bet_levels()
	payouts = keno_engine.get_payouts()

func draw(_picked_numbers: Array[int]) -> void:
	var result: Result = keno_engine.get_draw(_picked_numbers, current_bet_level)
	drawn_numbers = result.drawn_numbers
	picked_numbers = result.picked_numbers
	credits_won = result.credits_won
	picked_count = result.picked_count
	matched_count = result.matched_count

	print("Draw Result")
	print("Drawn Numbers: " + str(drawn_numbers))
	print("Picked Numbers: " + str(picked_numbers))
	print("Credits Won: " + str(credits_won))
	print("Picked Count: " + str(picked_count))
	print("Matched Count: " + str(matched_count))
	print("")

func increment_bet_level() -> void:
	if current_bet_level + 1 <= MathEngine.bet_levels.size():
		current_bet_level = current_bet_level + 1
	else:
		current_bet_level = 1

func decrement_bet_level() -> void:
	if current_bet_level - 1 == 0:
		current_bet_level = MathEngine.bet_levels.size()
	else:
		current_bet_level = current_bet_level - 1

func get_current_bet_credits() -> int:
	return int(bet_levels[current_bet_level - 1])

func draw_completed() -> void:
	keno_engine.draw_completed()

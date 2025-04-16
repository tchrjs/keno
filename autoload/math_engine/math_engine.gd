extends Node

@export_subgroup("Game Config")
@export var min_pick: int = 2
@export var max_pick: int = 10
@export var draw_number: int = 20
@export var pool_size: int = 80

var bet_levels: Array
var payouts: Array

var drawn_numbers: Array[int]
var picked_numbers: Array[int]
var credits_won: int
var picked_count: int
var matched_count: int

func _ready() -> void:
	bet_levels = KenoEngine.get_bet_levels()
	payouts = KenoEngine.get_payouts()

func draw(_picked_numbers: Array[int]) -> void:
	var result: Result = KenoEngine.get_draw(_picked_numbers)
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

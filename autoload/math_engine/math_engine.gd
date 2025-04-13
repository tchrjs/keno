extends Node

@export_subgroup("Game Config")
@export var min_pick: int = 2
@export var max_pick: int = 10
@export var draw_number: int = 20
@export var pool_size: int = 80

var drawn_numbers: Array[int]
var picked_numbers: Array[int]

func draw(_picked_numbers: Array[int]) -> void:
	var result: Result = KenoEngine.get_draw(_picked_numbers)
	drawn_numbers = result.drawn_numbers
	picked_numbers = result.picked_numbers

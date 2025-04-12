extends Node

@export_subgroup("Game Config")
@export var min_pick: int = 2
@export var max_pick: int = 10
@export var draw_number: int = 20
@export var pool_size: int = 80

var current_result: Result

func draw(picked_numbers: Array[int]) -> void:
	var result: Result = KenoEngine.get_draw(picked_numbers)
	current_result = result

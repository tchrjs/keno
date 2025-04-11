class_name Board extends Control

@export var top_grid_container: GridContainer
@export var bottom_grid_container: GridContainer

var spot_scene: PackedScene = load("res://components/board/spot.tscn")
var spots: Array[Spot] = []
var marked_spots: Array[Spot] = []

func _ready() -> void:
	# Add spots onto grid container.
	for i in range(1, MathEngine.pool_size + 1):
		var spot: Spot = spot_scene.instantiate()
		spot.set_number(i)
		spot.connect("mark_toggled", _on_spot_mark_toggled)
		spots.append(spot)
		@warning_ignore("integer_division")
		if i <= MathEngine.pool_size / 2:
			top_grid_container.add_child(spot)
		else:
			bottom_grid_container.add_child(spot)

func _on_spot_mark_toggled(spot: Spot, toggled_on: bool) -> void:
	if toggled_on:
		if marked_spots.size() < MathEngine.max_pick:
			marked_spots.append(spot)
			spot.toggle_mark(toggled_on)
	else:
		var spot_index: int = marked_spots.find(spot)
		if spot_index >= 0:
			marked_spots.remove_at(spot_index)
			spot.toggle_mark(toggled_on)

class_name Board extends Control

const SPOT_COUNT: int = 80

@export var top_grid_container: GridContainer
@export var bottom_grid_container: GridContainer

var spot_scene: PackedScene = load("res://components/board/spot.tscn")
var spots: Array[Spot] = []

func _ready() -> void:
	# Add spots onto grid container.
	for i in range(1, SPOT_COUNT + 1):
		var spot: Spot = spot_scene.instantiate()
		spot.text = str(i)
		spots.append(spot)
		if i <= 40:
			top_grid_container.add_child(spot)
		else:
			bottom_grid_container.add_child(spot)

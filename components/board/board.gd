class_name Board extends Control

signal marked_spots_updated
signal hit_count_updated(hit_count: int)

@export var play_state: Play
@export var top_grid_container: GridContainer
@export var bottom_grid_container: GridContainer

var spot_scene: PackedScene = load("res://components/board/spot/spot.tscn")
var spots: Array[Spot] = []
var marked_spots: Array[Spot] = []

var hits: int = 0

# Add spots onto grid container.
func _ready() -> void:
	for i: int in range(1, MathEngine.pool_size + 1):
		var spot: Spot = spot_scene.instantiate()
		spot.set_number(i)
		spot.connect("mark_toggled", _on_spot_mark_toggled)
		spot.connect("hit_toggled", _on_hit_toggled)
		spot.play_state = play_state
		spots.append(spot)
		@warning_ignore("integer_division")
		if i <= MathEngine.pool_size / 2:
			top_grid_container.add_child(spot)
		else:
			bottom_grid_container.add_child(spot)

# Clear all marked spots.
func clear() -> void:
	reset()
	for spot: Spot in marked_spots.duplicate():
		_on_spot_mark_toggled(spot, false)

# reset spots.
func reset() -> void:
	if hits > 0:
		hits = 0
		emit_signal("hit_count_updated", hits)
	for spot: Spot in spots:
		spot.reset()

func toggle(toggled_on: bool) -> void:
	for spot: Spot in spots:
		spot.disabled = !toggled_on

func _on_hit_toggled(toggled_on: bool) -> void:
	if toggled_on:
		hits += 1
		emit_signal("hit_count_updated", hits)

# Update marked spots.
func _on_spot_mark_toggled(spot: Spot, toggled_on: bool) -> void:
	reset()
	if toggled_on:
		if marked_spots.size() < MathEngine.max_pick:
			marked_spots.append(spot)
			spot.toggle_mark(toggled_on)
	else:
		var spot_index: int = marked_spots.find(spot)
		if spot_index >= 0:
			marked_spots.remove_at(spot_index)
			spot.toggle_mark(toggled_on)
	emit_signal("marked_spots_updated")

class_name Payouts extends Control

@export var board: Board
@export var highlight: ColorRect
@export var prizes_container: VBoxContainer

var rows: Array[PayoutsRow]

@onready var prize_scene: PackedScene = load("res://components/payouts/payouts_row/payouts_row.tscn")

func _ready() -> void:
	var children: Array[Node] = prizes_container.get_children()
	for i: int in range(1, children.size()):
		if children[i] is PayoutsRow:
			rows.append(children[i])
	board.connect("marked_spots_updated", update)

func update() -> void:
	var payouts: Array = MathEngine.payouts[str(MathEngine.current_bet_level)][board.marked_spots.size()]

	clear()
	var row_counter: int = 0
	for i: int in range(payouts.size() - 1, -1, -1):
		var win: int = payouts[i]
		if win == 0:
			continue
		var row: PayoutsRow = rows[row_counter]
		row.set_hits(i)
		row.set_win(win)
		row_counter += 1

func clear() -> void:
	toggle_highlight(false)
	for row: PayoutsRow in rows:
		row.clear()

func reset() -> void:
	toggle_highlight(false)

func set_highlight() -> void:
	var matched_row: PayoutsRow = null
	for row: PayoutsRow in rows:
		if row.hits == MathEngine.matched_count:
			matched_row = row
			break

	if matched_row:
		highlight.global_position = matched_row.global_position + matched_row.size / 2 - highlight.size / 2
		highlight.show()

func toggle_highlight(toggled_on: bool) -> void:
	highlight.visible = toggled_on

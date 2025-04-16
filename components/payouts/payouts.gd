class_name Payouts extends Control

@export var board: Board
@export var prizes_container: VBoxContainer

var rows: Array[PayoutsRow]

@onready var prize_scene: PackedScene = load("res://components/payouts/payouts_row.tscn")

func _ready() -> void:
	var children: Array[Node] = prizes_container.get_children()
	for i in range(1, children.size()):
		if children[i] is PayoutsRow:
			rows.append(children[i])
	board.connect("marked_spots_updated", update)

func update() -> void:
	var payouts: Array = MathEngine.payouts[board.marked_spots.size()]

	clear()
	var row_counter: int = 0
	for i in range(payouts.size() - 1, -1, -1):
		var win = payouts[i]
		if win == 0:
			continue
		var prize: PayoutsRow = rows[row_counter]
		prize.hits_label.text = str(i) if i >= 0 else ""
		prize.win_label.text = "$" + str("%0.2f" % (float(win) / 100)) if win > 0 else ""
		row_counter += 1

func clear() -> void:
	for row in rows:
		row.hits_label.text = ""
		row.win_label.text = ""

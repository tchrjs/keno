class_name PayoutsRow extends Control

@export var hits_label: Label
@export var initial_hits_text: String = ""
@export var win_label: Label
@export var initial_win_text: String = ""

var hits: int
var win: int

func _ready():
	hits_label.text = initial_hits_text
	win_label.text = initial_win_text

func set_hits(value: int) -> void:
	hits = value
	hits_label.text = str(hits) if hits >= 0 else ""

func set_win(value: int) -> void:
	win = value
	win_label.text = "$" + str("%0.2f" % (float(value) / 100)) if value > 0 else ""

func clear() -> void:
	hits_label.text = ""
	win_label.text = ""

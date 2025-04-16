class_name PayoutsRow extends Control

@export var hits_label: Label
@export var initial_hits_text: String = ""
@export var win_label: Label
@export var initial_win_text: String = ""

func _ready():
	hits_label.text = initial_hits_text
	win_label.text = initial_win_text

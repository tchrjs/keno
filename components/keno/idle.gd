class_name Idle extends State

@export var dashboard: Dashboard

func _ready() -> void:
	dashboard.connect("draw_pressed", _on_play_started)

func enter() -> void:
	dashboard.enable_all()

func exit() -> void:
	dashboard.disable_all()

func _on_play_started() -> void:
	transitioned.emit(self, "play")

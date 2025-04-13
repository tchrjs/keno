class_name Play extends State

@export var board: Board

var accept_inputs: bool = false
var tween: Tween

func _init() -> void:
	pass

func enter() -> void:
	board.reset()
	var picked_numbers: Array[int] = []
	for spot in board.marked_spots:
		picked_numbers.append(spot.number)
	MathEngine.draw(picked_numbers)
	await _draw()
	emit_signal("transitioned", self, "idle")

func exit() -> void:
	accept_inputs = false
	pass

func _draw() -> void:
	tween = create_tween()
	for drawn_number in MathEngine.drawn_numbers:
		var spot = board.spots[drawn_number - 1]
		if MathEngine.picked_numbers.has(drawn_number):
			tween.tween_callback(spot.toggle_hit.bind(true)).set_delay(0.25)
		else:
			tween.tween_callback(spot.toggle_overlay.bind(true)).set_delay(0.25)
	accept_inputs = true
	await tween.finished

func _input(event):
	if event.is_action_pressed("interrupt") and tween and accept_inputs:
		tween.custom_step(30)

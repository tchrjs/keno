class_name Spot extends Button

signal mark_toggled(spot: Spot, toggled_on: bool)
signal hit_toggled(toggled_on: bool)

@export var background: TextureRect
@export var mark: TextureRect
@export var label: Label
@export var hit: TextureRect
@export var overlay: ColorRect

@export var hit_sound: AudioStreamPlayer
@export var miss_sound: AudioStreamPlayer

var number: int = -1
var is_marked: bool = false

var play_state: Play

func set_number(new_number: int) -> void:
	number = new_number
	label.text = str(number)

func toggle_mark(toggled_on: bool) -> void:
	if toggled_on == is_marked:
		return

	is_marked = toggled_on
	label.text = "X" if is_marked else str(number)
	mark.visible = is_marked

func toggle_overlay(toggled_on: bool) -> void:
	overlay.visible = toggled_on
	if toggled_on and !play_state.has_interrupted:
		miss_sound.play()

func toggle_hit(toggled_on: bool) -> void:
	hit.visible = toggled_on
	label.text = "HIT" if toggled_on else "X" if is_marked else str(number)
	if toggled_on and !play_state.has_interrupted:
		hit_sound.play()
	emit_signal("hit_toggled", toggled_on)

func reset() -> void:
	toggle_overlay(false)
	toggle_hit(false)

func _on_mouse_entered() -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and !disabled:
		emit_signal("mark_toggled", self, !is_marked)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and !disabled:
		emit_signal("mark_toggled", self, !is_marked)

extends Control


@export_group("Buttons")
@export var back_button: Button = null
@export var reset_button: Button = null

@export_group("Sliders")
@export var red_slider: VSlider = null
@export var green_slider: VSlider = null
@export var blue_slider: VSlider = null

@export_group("Preview", "preview")
@export var preview_rect: ColorRect = null
@export var preview_label: Label = null

var red_value: float = 0.0
var green_value: float = 0.0
var blue_value: float = 0.0


func _ready() -> void:
	back_button.pressed.connect(_on_back_button_pressed)
	reset_button.pressed.connect(_on_reset_button_pressed)
	update_value()
	update_color()


func _process(_delta: float) -> void:
	update_value()
	update_color()


func update_value() -> void:
	red_value = red_slider.value * 255.0
	green_value = green_slider.value * 255.0
	blue_value = blue_slider.value * 255.0


func update_color() -> void:
	preview_rect.color = Color(red_slider.value, green_slider.value, blue_slider.value)
	preview_label.text = "(%d, %d, %d)" % [red_value, green_value, blue_value]


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://j07sbpwqexn2")


func _on_reset_button_pressed() -> void:
	get_tree().reload_current_scene()

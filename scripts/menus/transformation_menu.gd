extends Control


@export_group("Buttons")
@export var back_button: Button = null
@export var reset_button: Button = null


func _ready() -> void:
	back_button.pressed.connect(_on_back_button_pressed)
	reset_button.pressed.connect(_on_reset_button_pressed)


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://j07sbpwqexn2")


func _on_reset_button_pressed() -> void:
	get_tree().reload_current_scene()

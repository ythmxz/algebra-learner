extends Control


@export_group("Buttons")
@export var start_button: Button = null
@export var quit_button: Button = null

@export_group("Labels")
@export var version_label: Label = null


func _ready() -> void:
	start_button.pressed.connect(_on_start_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)

	version_label.text = ProjectSettings.get_setting("application/config/version")


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://j07sbpwqexn2")


func _on_quit_button_pressed() -> void:
	get_tree().quit()

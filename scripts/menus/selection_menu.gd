extends Control


@export_group("Buttons")
@export var back_button: Button = null
@export var transformation_button: Button = null
@export var interpolation_button: Button = null
@export var color_space_button: Button = null


func _ready() -> void:
	back_button.pressed.connect(_on_back_button_pressed)
	transformation_button.pressed.connect(_on_transformation_button_pressed)
	interpolation_button.pressed.connect(_on_interpolation_button_pressed)
	color_space_button.pressed.connect(_on_color_space_button_pressed)


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://3fkf3hk8rxym")


func _on_transformation_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://kj4jie05st6t")


func _on_interpolation_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://bu3nfbojqu06q")


func _on_color_space_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://ctu2t04bxqr43")

extends Control


const FINAL_SIZE := Vector2i.ONE * 1024

@export_group("Buttons")
@export var back_button: Button = null
@export var default_button: Button = null
@export var nearest_button: Button = null
@export var bilinear_button: Button = null
@export var bicubic_button: Button = null

@export_group("Images")
@export var default_image: Image = null
@export var preview_texture: TextureRect = null


func _ready() -> void:
	back_button.pressed.connect(_on_back_button_pressed)
	default_button.pressed.connect(_on_default_button_pressed)
	nearest_button.pressed.connect(_on_nearest_button_pressed)
	bilinear_button.pressed.connect(_on_bilinear_button_pressed)
	bicubic_button.pressed.connect(_on_bicubic_button_pressed)


func interpolate(mode: Image.Interpolation) -> void:
	var copy: Image = default_image.duplicate()
	copy.resize(FINAL_SIZE.x, FINAL_SIZE.y, mode)

	var interpolated_texture = ImageTexture.create_from_image(copy)
	preview_texture.texture = interpolated_texture


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://j07sbpwqexn2")

func _on_default_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_nearest_button_pressed() -> void:
	interpolate(Image.INTERPOLATE_NEAREST)


func _on_bilinear_button_pressed() -> void:
	interpolate(Image.INTERPOLATE_BILINEAR)


func _on_bicubic_button_pressed() -> void:
	interpolate(Image.INTERPOLATE_CUBIC)

extends TextureRect


const SPEED: float = 200.0

@export_group("Grid", "grid")
@export var grid_texture: TextureRect = null

var translation_direction := Vector2.ZERO
var scale_direction := Vector2.ZERO
var rotation_direction: float = 0.0


func _ready() -> void:
	global_position = grid_texture.size / 2.0
	pivot_offset = Vector2(0.0, size.y)


func _physics_process(delta: float) -> void:
	if grid_texture:
		var min_position := Vector2(grid_texture.global_position)
		var max_position := Vector2(grid_texture.global_position + grid_texture.size)

		global_position = global_position.clamp(min_position, max_position)

	translation_direction = Input.get_vector("translation_x-", "translation_x+", "translation_y+", "translation_y-")
	scale_direction = Input.get_vector("scale_x-", "scale_x+", "scale_y-","scale_y+")
	rotation_direction = Input.get_axis("rotation_left", "rotation_right")

	position += translation_direction * SPEED * delta
	scale += scale_direction * delta
	rotation += rotation_direction * delta

	if Input.is_action_just_pressed("pivot_origin"):
		pivot_offset = Vector2(0.0, size.y)
	if Input.is_action_just_pressed("pivot_center"):
		pivot_offset = size / 2.0

	if Input.is_action_just_pressed("mirror_x"):
		flip_h = !flip_h
	if Input.is_action_just_pressed("mirror_y"):
		flip_v = !flip_v

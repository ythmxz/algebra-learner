extends Label


var scale_tween: Tween = null
var rotation_tween: Tween = null

var default_scale := Vector2.ZERO
var default_rotation: float = 0.0


func _ready() -> void:
	pivot_offset = size / 2.0
	default_scale = scale
	default_rotation = rotation

	animate_scale()
	animate_rotation()


func animate_scale() -> void:
	scale_tween = create_tween()
	scale_tween.tween_property(self, "scale", scale * 1.05, 1.0)
	scale_tween.tween_property(self, "scale", default_scale, 1.0)
	scale_tween.set_loops()


func animate_rotation() -> void:
	rotation_tween = create_tween()
	rotation_tween.tween_property(self, "rotation", rotation + 0.05, 1.0)
	rotation_tween.tween_property(self, "rotation", default_rotation, 1.0)
	rotation_tween.tween_property(self, "rotation", rotation - 0.05, 1.0)
	rotation_tween.tween_property(self, "rotation", default_rotation, 1.0)
	rotation_tween.set_loops()

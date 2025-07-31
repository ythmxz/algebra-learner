extends Button


var scale_tween: Tween = null
var  default_scale := Vector2.ZERO


func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

	pivot_offset = size / 2.0
	default_scale = scale


func _on_mouse_entered() -> void:
	scale_up()


func _on_mouse_exited() -> void:
	scale_down()


func scale_up() -> void:
	scale_tween = create_tween()
	scale_tween.tween_property(self, "scale", scale * 1.1, 0.1)


func scale_down() -> void:
	scale_tween = create_tween()
	scale_tween.tween_property(self, "scale", default_scale, 0.1)

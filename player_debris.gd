extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is RigidBody2D:
			var angle = randf_range(0, 2*PI)
			var force = Vector2(cos(angle), sin(angle)) * randf_range(200, 400)
			child.linear_velocity = force
			child.angular_velocity = randf_range(-10, 10)
	await  get_tree().create_timer(2.0).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

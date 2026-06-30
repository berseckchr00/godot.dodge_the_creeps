extends RigidBody2D

var player_target = null
var tracking_time = 1.5 #un segundo de seguimiento

# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
	player_target = get_tree().get_first_node_in_group("player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _physics_process(delta):
	if tracking_time > 0 and player_target:
		tracking_time -= delta
		var direction = (player_target.position - position).normalized()
		linear_velocity = linear_velocity.lerp(direction * 200, 0.05)

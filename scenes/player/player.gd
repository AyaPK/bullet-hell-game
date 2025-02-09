extends CharacterBody2D

var speed: int = 75
var direction: Vector2 = Vector2.DOWN
@onready var player: Sprite2D = $Player

func _physics_process(delta: float) -> void:
	var input_dir: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")
		).normalized()
	if input_dir.x > 0:
		direction = input_dir
		player.frame = 1
		player.flip_h = false
	elif input_dir.x < 0:
		direction = input_dir
		player.frame = 1
		player.flip_h = true
	elif input_dir.y < 0:
		direction = input_dir
		player.frame = 2
		player.flip_h = false
	elif input_dir.y > 0:
		direction = input_dir
		player.frame = 0
		player.flip_h = false
	velocity = input_dir*speed
	move_and_slide()

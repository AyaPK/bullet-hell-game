extends CharacterBody2D

var speed: int = 75
var direction: Vector2 = Vector2.DOWN
@onready var player: Sprite2D = $Player
@onready var bullets: Node = $bullets
@onready var spawn_point: Marker2D = $SpawnPoint

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

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		spawn_point.position = direction*10
		var bullet_temp: Node  = bullets.get_bullet()
		bullet_temp.velocity = direction*100
		bullet_temp.global_position = spawn_point.global_position
		await get_tree().process_frame
		bullet_temp.show()

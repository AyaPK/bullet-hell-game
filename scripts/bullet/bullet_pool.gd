extends Node

var bullet_scene: PackedScene = preload("res://scenes/player/bullet.tscn")
var pool_size: int = 20
var bullet_pool: Array[Bullet] = []

func _ready() -> void:
	for i in range(pool_size):
		create_bullet()

func get_bullet() -> Bullet:
	for bullet in bullet_pool:
		if !bullet.visible:
			return bullet
	return create_bullet()

func reset_bullet(bullet: Bullet) -> void:
	bullet.position = Vector2(-10000, -10000)
	bullet.hide()

func create_bullet() -> Bullet:
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.bullet_pool = self
	bullet.hide()
	bullet_pool.append(bullet)
	add_child(bullet)
	return bullet

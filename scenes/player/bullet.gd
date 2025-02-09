class_name Bullet extends CharacterBody2D

var bullet_pool: Node
@onready var onscreen: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D


func _process(delta: float) -> void:
	self.rotation += 0.1
	move_and_slide()

func _physics_process(delta: float) -> void:
	if visible:
		if !onscreen.is_on_screen():
			print("resetting")
			bullet_pool.reset_bullet(self)

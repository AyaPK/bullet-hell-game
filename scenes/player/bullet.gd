extends CharacterBody2D

func _process(delta: float) -> void:
	self.rotation += 0.1
	move_and_slide()

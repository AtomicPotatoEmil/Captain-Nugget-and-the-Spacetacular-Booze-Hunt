extends AnimatedSprite


func _physics_process(delta):
	if $RayCast2D.is_colliding():
		self.play("highlight")
	else:
		self.play("default")
	pass

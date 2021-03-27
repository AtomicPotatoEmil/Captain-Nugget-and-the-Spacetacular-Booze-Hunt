extends AnimatedSprite

export var facing = ""

var captain_has_cannonball = false
signal captain_used_cannonball

func _physics_process(delta):
	if $RayCast2D.is_colliding() and captain_has_cannonball:
		self.play("highlight")
		if Input.is_action_just_pressed("F"):
			spawn_bullet()
	else:
		self.play("default")
	pass

func spawn_bullet():
	var cannonball = preload("res://PlayerShip/Cannonball.tscn")
	var c = cannonball.instance()
	add_child(c)
	c.global_position = $Position2D.global_position
	captain_has_cannonball = false
	emit_signal("captain_used_cannonball")
	pass

func _on_PlayerShip_captain_took_cannonball():
	captain_has_cannonball = true
	pass # Replace with function body.

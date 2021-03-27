extends Area2D

var speed = 100

func _physics_process(delta):
	if Input.is_action_pressed("E"):
		position.y -= speed * delta
	if Input.is_action_pressed("Q"):
		position.y += speed * delta
	
	position.y = clamp(position.y, 60, get_viewport_rect().size.y - 60)
	pass

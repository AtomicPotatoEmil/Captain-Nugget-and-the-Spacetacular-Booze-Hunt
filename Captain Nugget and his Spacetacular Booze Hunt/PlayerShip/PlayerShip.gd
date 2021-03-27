extends Area2D

var speed = 100
onready var helm_cast = get_node("ShipHelm/HelmCast")
onready var helm_buttons = get_node("UI/HelmetControl")

onready var left_buttom_particles = get_node("BackParticles/LeftButtom")
onready var right_buttom_particles = get_node("BackParticles/RightButtom")

func _physics_process(delta):
	ship_helmet(delta)
	position.y = clamp(position.y, 60, get_viewport_rect().size.y - 60)
	pass

func ship_helmet(delta):
	if helm_cast.is_colliding():
		get_input(delta)
		$ShipHelm.play("highlight")
		helm_buttons.show()
	else:
		$ShipHelm.play("default")
		helm_buttons.hide()
	pass

func get_input(delta):
	if Input.is_action_pressed("Q"):
		position.y -= speed * delta
		left_buttom_particles.emitting = true
		right_buttom_particles.emitting = true
	else:
		left_buttom_particles.emitting = false
		right_buttom_particles.emitting = false
	if Input.is_action_pressed("E"):
		position.y += speed * delta
	pass

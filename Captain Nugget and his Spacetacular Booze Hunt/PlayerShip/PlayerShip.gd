extends Area2D

var speed = 100
onready var helm_cast = get_node("ShipHelm/HelmCast")
onready var helm_buttons = get_node("UI/HelmetControl")

var captain_has_cannonball = false;
signal captain_took_cannonball

onready var left_buttom_particles = get_node("BackParticles/LeftButtom")
onready var right_buttom_particles = get_node("BackParticles/RightButtom")

func _physics_process(delta):
	ship_helmet(delta)
	position.y = clamp(position.y, 60, get_viewport_rect().size.y - 60)
	
	if $Cannonballs/RayCast2D.is_colliding() and captain_has_cannonball == false:
		$Cannonballs.play("highlight")
		if Input.is_action_just_pressed("F"):
			captain_has_cannonball = true
			for node in $Cannons.get_children():
				node.captain_has_cannonball = true
	else:
		$Cannonballs.play("default")
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





func _on_Cannon_captain_used_cannonball():
	for node in $Cannons.get_children():
		node.captain_has_cannonball = false
		captain_has_cannonball = false
	pass # Replace with function body.


func _on_Cannon2_captain_used_cannonball():
	for node in $Cannons.get_children():
		node.captain_has_cannonball = false
		captain_has_cannonball = false
	pass # Replace with function body.


func _on_Cannon3_captain_used_cannonball():
	for node in $Cannons.get_children():
		node.captain_has_cannonball = false
		captain_has_cannonball = false
	pass # Replace with function body.


func _on_Cannon4_captain_used_cannonball():
	for node in $Cannons.get_children():
		node.captain_has_cannonball = false
		captain_has_cannonball = false
	pass # Replace with function body.


func _on_Cannon5_captain_used_cannonball():
	for node in $Cannons.get_children():
		node.captain_has_cannonball = false
		captain_has_cannonball = false
	pass # Replace with function body.


func _on_Cannon6_captain_used_cannonball():
	for node in $Cannons.get_children():
		node.captain_has_cannonball = false
		captain_has_cannonball = false
	pass # Replace with function body.

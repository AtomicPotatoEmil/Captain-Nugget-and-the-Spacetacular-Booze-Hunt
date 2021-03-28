extends Area2D

var speed = 150
onready var fly_timer = $FlyTimer

var missile_countdown = 10
onready var missile_contdown_timer = $MissileCountdownTimer

var dead = false



func _ready():
	$Label.hide()
	randomize()
	fly_timer.wait_time = rand_range(0.1, 1)
	fly_timer.start()
	pass

func _physics_process(delta):
	$Label.text = str(missile_countdown)
	position.y += speed * delta
	pass


func _on_FlyTimer_timeout():
	speed = 0
	missile_contdown_timer.start()
	fly_timer.stop()
	$Label.show()
	pass # Replace with function body.


func _on_MissileCountdownTimer_timeout():
	print(missile_countdown)
	missile_countdown -= 1
	if missile_countdown <= 0 and dead == false:
		$Label.show()
		var left_rocket = preload("res://Characters/GooseBullet.tscn")
		var l = left_rocket.instance()
		get_parent().add_child(l)
		l.global_position = $SpawnPointLeft.global_position
		l.direction = -1
		var right_rocket = preload("res://Characters/GooseBullet.tscn")
		var r = right_rocket.instance()
		get_parent().add_child(r)
		r.direction = 1
		r.global_position = $SpawnPointRight.global_position
		speed = 150
		randomize()
		fly_timer.wait_time = rand_range(0.1, 1)
		fly_timer.start()
		missile_countdown = 10
		missile_contdown_timer.stop()
	else:
		missile_contdown_timer.start()
	pass # Replace with function body.



func _on_GooseShip_area_entered(area):
	$Label.hide()
	dead = true
	$AnimatedSprite.play("dead")
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "dead":
		queue_free()
	pass # Replace with function body.

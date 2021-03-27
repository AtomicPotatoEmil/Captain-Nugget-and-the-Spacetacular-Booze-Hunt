extends KinematicBody2D

var velocity = Vector2()
var speed = 70;

func _ready():
	$Sprite.play("idle")
	pass
	
func _physics_process(delta):
	get_input(delta)
	move_and_slide(velocity)
	pass

func get_input(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("right"):
		velocity.x += 1 * delta
		$Sprite.flip_h = true
	if Input.is_action_pressed("left"):
		velocity.x -= 1 * delta
		$Sprite.flip_h = false
	if Input.is_action_pressed("down"):
		velocity.y += 1 * delta
	if Input.is_action_pressed("up"):
		velocity.y -= 1 * delta 
	
	velocity = velocity.normalized() * speed
	
	if velocity.x > 0 or velocity.y > 0:
		$Sprite.play("run")
	else:
		$Sprite.play("idle")
	pass

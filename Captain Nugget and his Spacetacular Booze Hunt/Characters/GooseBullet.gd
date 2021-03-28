extends Area2D

var speed = 200
var direction = 1

func _physics_process(delta):
	position.x += speed * delta * direction
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_GooseBullet_area_entered(area):
	queue_free()
	pass # Replace with function body.

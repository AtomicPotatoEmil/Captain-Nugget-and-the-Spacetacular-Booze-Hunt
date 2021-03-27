extends Area2D

var speed = 1500;

func _physics_process(delta):
	position.x -= speed * delta
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.

extends Node2D

onready var spawn_timer = $SpawnTimer1
onready var spawn_timer2 = $SpawnTimer2
onready var spawn_timer3 = $SpawnTimer3
onready var spawn_timer4 = $SpawnTimer4

func _ready():
	randomize()
	spawn_timer.wait_time = rand_range(3, 5)
	spawn_timer2.wait_time = rand_range(5, 10)
	spawn_timer3.wait_time = rand_range(5, 10)
	spawn_timer4.wait_time = rand_range(3, 5)
	spawn_timer.start()
	spawn_timer2.start()
	spawn_timer3.start()
	spawn_timer4.start()
	pass

func _on_SpawnTimer1_timeout():
	var goose_ship = preload("res://Characters/GooseShip.tscn")
	var g = goose_ship.instance()
	get_parent().add_child(g)
	g.global_position = $SpawnPoint.global_position
	randomize()
	spawn_timer.wait_time = rand_range(10, 15)
	spawn_timer.start()
	pass # Replace with function body.


func _on_SpawnTimer2_timeout():
	var goose_ship = preload("res://Characters/GooseShip.tscn")
	var g = goose_ship.instance()
	get_parent().add_child(g)
	g.global_position = $SpawnPoint2.global_position
	randomize()
	spawn_timer2.wait_time = rand_range(30, 40)
	spawn_timer2.start()
	pass # Replace with function body.


func _on_SpawnTimer3_timeout():
	var goose_ship = preload("res://Characters/GooseShip.tscn")
	var g = goose_ship.instance()
	get_parent().add_child(g)
	g.global_position = $SpawnPoint3.global_position
	randomize()
	spawn_timer3.wait_time = rand_range(30, 40)
	spawn_timer3.start()
	pass # Replace with function body.


func _on_SpawnTimer4_timeout():
	var goose_ship = preload("res://Characters/GooseShip.tscn")
	var g = goose_ship.instance()
	get_parent().add_child(g)
	g.global_position = $SpawnPoint4.global_position
	randomize()
	spawn_timer4.wait_time = rand_range(15, 20)
	spawn_timer4.start()
	pass # Replace with function body.


func _on_PlayerShip_hit():
	$Lifebar.value -= 1
	pass # Replace with function body.

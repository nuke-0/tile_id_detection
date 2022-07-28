extends KinematicBody2D


onready var _tilemap = get_parent().get_node("TileMap")
#onready var _collision_pos = $Area2D.global_position
#onready var _tile_id = _tilemap.get_cellv(_tilemap.world_to_map(_collision_pos))


var _velocity = Vector2.ZERO


func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_velocity.x += 100
	elif Input.is_action_pressed("ui_left"):
		_velocity.x -= 100
	else:
		_velocity.x = 0
	
	_velocity = move_and_slide(_velocity)


func _on_Area2D_body_entered(_body):
	print("Entered")
	
	var _collision_pos = $Area2D.global_position
	var _tile_id = _tilemap.get_cellv(_tilemap.world_to_map(_collision_pos))
	
	if _tile_id == 0:
		print("TILE ID 0 - DETECTED")
	elif _tile_id == 1:
		print("TILE ID 1 - DETECTED")


func _on_Area2D_body_exited(_body):
	print("Exited")


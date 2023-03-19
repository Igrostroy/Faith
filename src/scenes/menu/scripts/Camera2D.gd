extends Camera2D




# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var MAX_BOUNDARIES = Vector2(1800, 1000)
var MIN_BOUNDARIES = Vector2(40, 40)
@export var MOVE_SPEED = 450.0

var old_mouse_position = null 

var ZOOM_OFFSET = 0.25
var ZOOM_SPEED = 4.0




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if old_mouse_position == null:
		old_mouse_position = get_global_mouse_position()
		
	var size = get_viewport_rect().size

	var mouse_position = get_viewport().get_mouse_position()
	if mouse_position.x < MIN_BOUNDARIES.x:
		position.x -= delta * MOVE_SPEED
		print('x < 40')
	if mouse_position.x > MAX_BOUNDARIES.x:
		print('x > 1000')
		position.x += delta * MOVE_SPEED
	
	if mouse_position.y > MAX_BOUNDARIES.y:
		position.y += delta * MOVE_SPEED
	if mouse_position.y < MIN_BOUNDARIES.y:
		position.y -= delta * MOVE_SPEED
	
	var new_mouse_position = get_global_mouse_position()
	var offset = new_mouse_position - old_mouse_position;
	old_mouse_position = new_mouse_position
	
	if Input.is_action_pressed("drag"):

		position -= offset * delta * MOVE_SPEED
	if Input.is_action_pressed("ui_down"):
		$Camera2D.zoom += Vector2(ZOOM_OFFSET, ZOOM_OFFSET) * delta * ZOOM_SPEED
		print('ZOOM')
	if Input.is_action_pressed("ui_up") and $Camera2D.zoom.x > 1 and $Camera2D.zoom.y > 1:
		$Camera2D.zoom -= Vector2(ZOOM_OFFSET, ZOOM_OFFSET) * delta * ZOOM_SPEED

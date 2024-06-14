extends Camera3D
var score
var health

func _ready():
	score = 0
	health = 3
func raycast_from_mouse(m_pos):
	var ray_start = project_ray_origin(m_pos)
	var ray_end = ray_start + project_ray_normal(m_pos) * 100
	var world3d : World3D = get_world_3d()
	var space_state = world3d.direct_space_state
	
	if space_state == null:
		return
	
	var query = PhysicsRayQueryParameters3D.create(ray_start, ray_end)
	query.collide_with_areas = true
	
	return space_state.intersect_ray(query)   
	
func _process(delta):
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) :
		print(raycast_from_mouse(get_viewport().get_mouse_position()))
	

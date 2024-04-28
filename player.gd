extends CharacterBody3D

const SPEED = 20.0
const Z_MIN = -10.0
const Z_MAX = 10.0
const Y_MIN = 2.0
const Y_MAX = 10.0

signal collision()

func _physics_process(_delta):
  var input_dir = Input.get_vector("ui_down", "ui_up", "ui_left", "ui_right")
  var direction = (transform.basis * Vector3(0, input_dir.x, input_dir.y)).normalized()
  if direction:
    velocity.y = direction.y * SPEED
    velocity.z = direction.z * SPEED
  else:
    velocity.y = move_toward(velocity.y, 0, SPEED)
    velocity.z = move_toward(velocity.z, 0, SPEED)

  move_and_slide()
  position.y = clamp(position.y, Y_MIN, Y_MAX)
  position.z = clamp(position.z, Z_MIN, Z_MAX)


func _on_collision_entered(_body):
  collision.emit()

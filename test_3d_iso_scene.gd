extends Node3D

func _physics_process(delta):
  %Player.position.x += 10 * delta
  if %Player.position.x > 30:
    %Player.position.x = -30

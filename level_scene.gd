extends Node3D

func _physics_process(delta):
  %Player.position.x += 10 * delta

  if Input.is_action_pressed("ui_restart"):
    get_tree().reload_current_scene()


func _on_player_collision():
  await get_tree().process_frame
  get_tree().reload_current_scene()

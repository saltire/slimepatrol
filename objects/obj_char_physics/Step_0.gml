if keyboard_check(left)
  physics_apply_force(x, y, -spd, 0);
  
if keyboard_check(right) 
  physics_apply_force(x, y, spd, 0);
  
if keyboard_check_pressed(jump) and physics_test_overlap(x, y + 1, 0, obj_static_parent)
  physics_apply_impulse(x, y, 0, -jmp);
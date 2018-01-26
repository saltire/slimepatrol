if keyboard_check(right) {
  physics_apply_torque(spd);
}

if keyboard_check(left) {
  physics_apply_torque(-spd);
}

if keyboard_check(jump) and physics_test_overlap(x, y + 2, 0, obj_wall) {
  physics_apply_force(x, y, 0, -jmp);
}
include <../../configuration.scad>
use <../carriage.scad>
use <../effector.scad>
use <../fan_mount.scad>

use <../../legacy/SCAD/motor_end.scad>

cube([170,170,1]);

for (a = [0,40,80]) translate([42,12+a,carriage_height]) rotate([0,180,0]) new_carriage();

//for (a = [0,60,120]) translate([140,20+a,carriage_height]) motor_end();

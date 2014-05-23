include <../../configuration.scad>
use <../carriage.scad>

for (a = [0,120,240]) rotate([0,0,a]) translate([0,-35,carriage_height]) rotate([0,180,0]) new_carriage();

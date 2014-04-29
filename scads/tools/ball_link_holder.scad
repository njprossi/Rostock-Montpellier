include <../configuration.scad>;
use <../standard_parts/ball_link.scad>


difference() {
translate([10,0,0]) cube([50,20,8],true);
translate([0,0,4]) union() {
ball_link();
sphere(r = 4);
translate([20,0,0]) rotate([0,90,0]) cylinder(h = 40, r = 4/2, center = true);
translate([-15,0,-2]) cube([15,30,8],true);
}
}
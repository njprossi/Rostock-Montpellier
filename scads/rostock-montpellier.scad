include <configuration.scad>;
include <MCAD/stepper.scad>;
use <assembly/column.scad>;
use <assembly/effector_asm.scad>;
use <printed_parts/fan_mount.scad>;
use <build_volume.scad>;
use <standard_parts/fan.scad>;
use <standard_parts/board.scad>;
use <legacy/SCAD/frame.scad>;

show_build_volume = false;

translate([0,0,spacing-28-23.5-carriage_altitude]) effector_asm();

for (a=[60:120:300]) rotate([0,0,a]) {
//rotate([0,0,60]) {
translate([0,-delta_smooth_rod_offset,0]) column();
}

//Build volume
if (show_build_volume == true) {
build_volume(spacing-28-23.5,73.5,ball_angle*2);
//color("Red",.5) cylinder(200,100,100,false);
//color("Blue",.5) cylinder(170,printbed_diameter/2,printbed_diameter/2,false);
//color("Red") circle(printbed_diameter/2);
}

translate([65,45,-6-22]) rotate([90,0,0]) motor(Nema17, NemaLong, dualAxis=false);

//Fans (of Jeremie F.)
translate([0,-95,0]) union() {
translate([0,0,-30])rotate([-90,0,0]) fan_mount();
for(x=[-40.5,0,40.5]) translate([-20+x,-10,-10]) rotate([-90,0,0]) 40mm_fan();
}
//translate([60,40,-6-44]) rotate([0,0,0]) 76mm_turbine();

//Boards
//translate([-35,8,-6-22]) rotate([0,0,180-30]) ramps();
//translate([0,-30,-6-32]) rotate([0,0,0]) printrboard();

translate([0,0,-6-44]) lower_frame();
include <../configuration.scad>
use <../legacy/motor_end.scad>

echo_result=false;

for (rz=[60,180]) rotate([0,0,rz]) {
	color("red") translate([0,delta_smooth_rod_offset,0]) rotate([0,180,180]) motor_end();
	translate([0,printbed_diameter/2+7,0.1]) rotate([0,0,0]) bed_holder();
}
bed_abs(printbed_diameter,1);
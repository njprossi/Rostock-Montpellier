include <../configuration.scad>;

$fn=16;

ball_link();

module ball_link() {
	color("DarkSlateGray") difference() {
		union() {
			cylinder(h = 5, r = 5, center = true);
			translate([(23-9)/2,0,0]) cube([23-9,8,5],true);
			translate([23-(9.5)/2,0,0]) cube([9.5,8,6],true);
			for(m = [0,1]) mirror([ 0, m, 0 ]) rotate([0,0,-5]) translate([0,0,-2.5]) cube([12,5,5],false);
		}
		sphere(r=3,center = true);
		cylinder(h = 10, r = 2.8, center = true);
		//sphere(r= 4);
	}
}
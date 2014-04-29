include <../configuration.scad>

$fa=3;
$fs=1;

diagonal_rod_holder();

module diagonal_rod_holder() {
	color("purple") intersection() {
		difference() {
			for(a = [1:3]){
				rotate([0,0,a*120-30]) translate([30,0,0]) cube([60,25,4],true);
			}
			for(a = [1:3]){
				rotate([0,0,a*120-30]) translate([20,0,0]) cube([25,15,6],true);
			}
			for(a = [1:3]){
				rotate([0,0,a*120]) union() {
					for(x = [-1,1]) {
						translate([x*ball_link_distance/2,-delta_effector_offset,0]) cylinder(h = 30, r=diagonal_rod_diameter/2+0.1, center = true);
						translate([x*ball_link_distance/2,-delta_effector_offset,-5]) rotate([0,0,-135]) cube([6,6,10],false);
					}
				}
			}
			cylinder(h = 10, r = 8.5/2, center = true);
		}
		cylinder(h = 10, r =44, center = true);
	}
}
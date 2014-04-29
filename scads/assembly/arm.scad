include <../configuration.scad>;
use <../standard_parts/ball_link.scad>;
use <../machined_parts/diagonal_rod.scad>;

module arm() {
	rotate([0,-90,0]) ball_link();
	translate([0,0,delta_diagonal_rod]) rotate([0,90,0]) ball_link();
	translate([0,0,(delta_diagonal_rod-diagonal_rod_length)/2]) diagonal_rod();
}

arm();
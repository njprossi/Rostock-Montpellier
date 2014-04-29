include <../configuration.scad>

module jig() {
difference() {
	square([delta_diagonal_rod+20,20],center = true);
	for(x=[-delta_diagonal_rod/2,delta_diagonal_rod/2]) translate([x,0,0]) circle(3.05/2);
}
}
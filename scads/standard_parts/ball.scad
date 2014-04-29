include <../configuration.scad>;

$fa=2;
$fs=1;

//Kavan Maxi Ball Link 1408

module ball(env) {
	color("grey") difference() {
		union() {
			translate([-ball_offset,0,0]) sphere(r=3,center = true);
			translate([-ball_offset/2,0,0]) rotate([0,90,0]) cylinder( h = ball_offset, r = 3.8/2, center = true);
			translate([5,0,0]) rotate([0,90,0]) cylinder( h = 10, r = 1.5, center = true);
			translate([-0.5,0,0]) rotate([0,90,0]) cylinder( h = 1, r = (7*2/sqrt(3))/2, center = true, $fn = 6);
		}
		translate([-9.6,0,0]) rotate([0,90,0]) cylinder( h = 1, r = 4, center = true, $fn = 6);
	}
	if (env) {
		color("black",0.5) translate([-6.5,0,0]) sphere(r=5,center = true);
	}
}

ball();
//ball(true);
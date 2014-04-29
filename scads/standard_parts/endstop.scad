include <../configuration.scad>;

module endstop() {
	color("white") difference() {
		translate([0,-30.5/2+6.5,1.65/2]) cube([21,30.5,1.65],true);
		for(a=[-1,1]) translate([a*17/2,0,0]) cylinder(h=5, r=3/2, center=true);
	}
	translate([0,3.5+6.5,1.65+0.5]) union() {
		color("black") cube([4,3,1.5],true);
		color("grey") for(a=[-2.5/2,0,2.5/2]) translate([a,0,0]) rotate([90,0,0]) cylinder(h=7.5,r=0.5,center=false, $fn=6);
	}
}

endstop();
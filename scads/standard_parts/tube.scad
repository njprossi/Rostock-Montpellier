include <configuration.scad>

module tube(od,id,l) {
	color("white",0.8) difference() {
		cylinder(l,od/2,od/2);
		translate([0,0,-1]) cylinder(l+2,id/2,id/2);
	}
}

tube(4,2.5,20);
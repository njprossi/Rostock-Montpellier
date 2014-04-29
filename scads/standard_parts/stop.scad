include <configuration.scad>;

module stop() {
	color("black") translate([0,0,5])  cylinder(h = 10, r = 15/2,center=true);
	color("silver") translate([0,0,-15/2])  cylinder(h = 15, r = 4/2,center=true);
}
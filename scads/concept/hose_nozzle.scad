$fa=1;
$fs=.5;

id=11;
od=id+1.6;

module spout() {
	difference() {
		cylinder(15,id/2,(id-.5)/2,false);
		translate([id/2,-id,6]) rotate([0,-30,0]) cube(2*id,false);
	}
}

difference() {
	union() {
		minkowski() {spout();sphere((od-id)/2);}
		cylinder(0.2,(od+5)/2,(od+5)/2,false);
	}
	spout();
	translate([-od/2,0,15+(od-id)/2]) rotate([90,0,0]) cylinder(2*od,od/2,od/2,true);
	translate([0,0,-id]) cube(2*id,true);
}
use <../library/screwthread.scad>
//$fn=36;
$fa=1;
$fs=.5;

difference() {
	union() {
		cylinder(5,20,20,false);
		translate([0,0,5]) cylinder(10,20,12,false);
		translate([0,0,15]) cylinder(13,12,12,false);
		translate([0,0,28]) cylinder(2,12,9.5,false);
	}
	union() {
		translate([0,0,5]) cylinder(10,8,7.5,false,$fn=36);
		translate([0,0,15]) thread(1,17,20,10);
		translate([0,0,28.75]) cylinder(1,7,9,true);
		translate([0,0,30]) cylinder(1.5,9.2,9.2,true);
		translate([0,-10,10]) rotate([90,0,0]) cylinder(20,2.2,2.2,true,$fn=36);
	}
}
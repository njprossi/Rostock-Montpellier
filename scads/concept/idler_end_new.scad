rod_diameter=8;

rod_radius=rod_diameter/2;

rod_od_dia=rod_diameter+6;
rod_od_rad=rod_od_dia/2;

difference() {
	union() {
		for (x=[-1,1]) translate([x*30,0,0]) cylinder(14,rod_od_rad,rod_od_rad,false);
		translate([0,0,7]) cube([60,rod_od_dia,14],true);
	}
	for (x=[-1,1]) translate([x*30,0,-1]) cylinder(14+2,rod_radius,rod_radius,false);
translate([0,-rod_od_rad,7]) cube([40,rod_od_dia,16],true);
translate([0,0,7]) rotate([89,0,0]) cylinder(rod_od_dia*2,8/2,8/2,true);
}
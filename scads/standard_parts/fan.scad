module 40mm_fan() {
	color("DimGrey") difference() {
		cube([40,40,10],false);
		translate([20,20,0]) cylinder(30,38/2,38/2,true);
		for(x=[-16,16]) for(y=[-16,16]) translate([x+20,y+20,0]) cylinder(30,3/2,3/2,true);
	}
}

module 76mm_turbine() {
	color("DimGrey") difference() {
		union() {
			translate([-76/2,0,0]) cube([76/2,76/2,30],false);
			difference() {
				translate([0,0,15])cylinder(30,76/2,76/2,true);
				rotate([0,0,180]) translate([0,-76,-5])cube([76*2,76*2,40],false);
			}
			translate([0,-5,15])cylinder(30,66/2,66/2,true);
		}
	translate([0,0,20]) cylinder(30,47/2,47/2,true);
	}
}

//40mm_fan();
76mm_turbine();
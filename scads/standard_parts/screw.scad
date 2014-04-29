$fn=16;

module chc_m3(length) {
	color("grey") union() {
		rotate([180,0,0]) cylinder(h=3,r=5.5/2,center=false);
		cylinder(h=length,r=1.5,center=false);
	}
}

module tbhc_m3(length) {
	color("grey") union() {
		rotate([180,0,0]) cylinder(h=2,r=7/2,center=false);
		cylinder(h=length,r=1.5,center=false);
	}
}

tbhc_m3(12);
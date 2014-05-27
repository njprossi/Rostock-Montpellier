$fa=1;
$fs=0.5;

module fan_mount() {
th=1.2;
d_fan=40.5;
d_fix=32;
m_fix=2.5;
h=43.5;
h_mount=20;
h_fix=6;
l_fix=12;
p_fix=6;

color("red") difference() {
	union() {
		for(n = [-1:1]) translate([n*d_fan,0,0]) union() {
			cube([d_fan,h,th],true);
			//assign(h_fan=h_mount*cos(n*60))
			translate([0,0,h_mount/2]) union(){
				cylinder(h = h_mount, r = d_fan/2, center = true);
				cube([l_fix,h,h_mount],true);
			}
			for(x = [-d_fix/2, d_fix/2]) {
				for(y = [-d_fix/2, d_fix/2]) {
					translate([x, y,h_fix/2])
					cylinder(h = h_fix, r = m_fix/2+th, center = true);
				}
			}
			for(a = [-45,45]) rotate([0,0,a]) translate([0, 0,h_fix/2]) cube([m_fix+2*th,d_fix*sqrt(2),h_fix], center = true);
		}
		translate([0,0,h_mount/2]) cube([2*d_fan,l_fix,h_mount],true);
	}

	for(n = [-1:1]) translate([n*d_fan,0,0]) union() {
		cylinder(h = h_mount*3, r = d_fan/2-th, center = true);
		for(x = [-d_fix/2, d_fix/2]) {
			for (y = [-d_fix/2, d_fix/2]) {
				translate([x, y,h_fix/2])
				cylinder(h = h_mount, r = m_fix/2, center = true);
			}
		}
		translate([10,18,-th]) cube([3,4,2*th],false);
	}
	
	for(n = [-1,1]) translate([n*d_fan,h/2-th,p_fix]) rotate([-90,0,0]) union() {
		translate([0,0,2*th]) cylinder(h =4*th, r = 4/2, center = true);
		translate([0,-h_mount/2,2*th]) cube([4,h_mount,4*th],true);
		translate([0,0,-2*th]) cylinder(h =4*th, r = (l_fix-2*th)/2, center = true);
		translate([0,-h_mount/2,-2*th]) cube([l_fix-2*th,h_mount,4*th],true);
	}
}

}

fan_mount();

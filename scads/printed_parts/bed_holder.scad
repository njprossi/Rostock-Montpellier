$fa=1;
$fs=0.5;

module bed_holder() {
	color("Red") rotate([0,-90,90]) difference() {
		intersection() {
			union() {
					hull() for(d=[-1,1]) translate([-6,d*5,0])  cylinder(d=20,h=30);
					rotate([0,90,0]) cylinder(d=20,h=8);
				}
				translate([-5,-9,-50])cube([20,18,100]);
				rotate([0,90,0]) cylinder(r=16,h=20);
			}
		rotate([0,90,0]) cylinder(d=4.2,h=20,center=true);
	}
}

bed_holder();

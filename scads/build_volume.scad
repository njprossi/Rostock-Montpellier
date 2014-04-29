include <configuration.scad>

module arm_vol(h,d,a) {
	translate([0,delta_smooth_rod_offset-delta_carriage_offset,0]) difference() {
			translate([0,0,0]) cylinder(h=h-d,r=delta_diagonal_rod+delta_effector_offset,center=false);
			translate([0,delta_diagonal_rod*2,0]) cube([delta_diagonal_rod*4,delta_diagonal_rod*4,h*2],true);
			for (x=[-1,1]) translate([x*(sin(a/2)*delta_diagonal_rod+delta_diagonal_rod),0,0]) cube([delta_diagonal_rod*2,delta_diagonal_rod*2,h*2],true);
translate([0,0,h-d]) sphere(r=delta_diagonal_rod);
	}
}

module build_volume(h,d,a) {
	color("SteelBlue",.7) intersection() {
		rotate([0,0,120]) arm_vol(h,d,a);
		rotate([0,0,240]) arm_vol(h,d,a);
		rotate([0,0,360]) arm_vol(h,d,a);
	}
}

build_volume(400,50,2*25);
cylinder(2,printbed_diameter/2,printbed_diameter/2,true);
//arm_vol(400,50,52);
include <../configuration.scad>
use <../library/udf.scad>

module bowden_holder() {
	difference() {
		union() {
			cylinder(5,platform_dia/2,platform_dia/2,true);
			//translate([0,0,2.5]) cylinder(3,(hotend_diameter+2)/2,hotend_diameter/2,false);
		}
		union() {
			translate([0,0,-1]) {
					cylinder(h=20,r=5.5/2,center=true);
					cylinder(h=6,r1=8.5/sqrt(3),r2=10.5/sqrt(3),center=false,$fn=6);
			}
			//translate([0,0,2.5]) cylinder(6,(hotend_diameter-2)/2,(hotend_diameter-2)/2,false);
			translate([0,0,2]) for (a = [1:3]){
				rotate([0,180,a*360/3]) translate([0,platform_fix_dia/2,0]) nut_cutout_2(5,90,false,true);
			}
			hull()for (a=[45,75]) rotate([0,0,a]) {
				for (y=[hotend_diameter/2+3,platform_dia/2]) translate([0,y,0]) cylinder(20,6/2,6/2,true);
			}
		}
	}
}

bowden_holder();
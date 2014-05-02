include <../configuration.scad>
use <../library/udf.scad>

//echo_result=false;
$fa = 1;

platform_thickness=10;

//fixing points
n=3;

//big inside hole, fixing point dia, outside dia
d1=hotend_diameter;
d2=platform_fix_dia;
d3=platform_dia;
d4=delta_effector_offset*2-platform_thickness/2-4;
df=3.5;

module new_effector() {
	color("red") difference(){
		union () {
			intersection (){
				union() {
					cylinder(h=platform_thickness+2, r=d3/2, center=true);
					for (a = [1:3]) rotate([0,0,-30+a*120]) {
						translate([(d4)/2,0,0]) rotate([90,0,0]) cylinder(h=ball_distance, r=platform_thickness,center = true);
					}
				}
				cylinder(h = platform_thickness, r = delta_effector_offset*2, center = true);
			}
		}
		union () {

			//Hotend hole
			hull() {
				cylinder(h = platform_thickness+2, r=d1/2+2, center = true);
				for (b = [-12,12]) rotate([0,0,b]) translate([0,d1/2+5/2,0]) cylinder(platform_thickness+2,5/2,5/2,true);
			}

			//Fixing holes
			for (a = [1:n]){
				//rotate([0,180,a*360/n+60]) translate([0,d2/2,0]) cylinder(platform_thickness*2,df/2,df/2,true);
				rotate([0,180,a*360/n+60]) translate([0,d2/2,-platform_thickness/2]) nut_cutout_2(platform_thickness,90,false,true);
			}
			
			//Ball fix points
			for (a = [1:3]) rotate([0,0,60+a*120]) translate([0,-delta_effector_offset,0]) rotate([90,0,90]) nut_well_2(9,ball_distance,carriage_height+1,-10,false);
		}
	}
}

new_effector();
//rotate([0,0,90]) new_effector();
include <../configuration.scad>
use <../library/udf.scad>
use <../standard_parts/ball.scad>;

echo_result=true;

module new_carriage() {
	bearing_od=bearing_diameter+6;
	bearing_radius=bearing_diameter/2;
	clamp_h=ceil(carriage_height/3)*3;
	color("red",1) difference() {
		union() {
			for(x = [1]) translate([x*rod_spacing/2,0,carriage_height/2])
				cylinder(h=carriage_height,d=bearing_od,center=true);
			hull() for(x = [-rod_spacing/2-0.75,-rod_spacing/2+0.75])
				translate([x,0,carriage_height/2]) {
					cylinder(h=carriage_height,d=bearing_od,center=true);
			}
			translate([0,(bearing_od)/4,carriage_height/2])
				cube([rod_spacing,(bearing_od)/2,carriage_height],true);
			translate([rod_spacing/4,-(bearing_od)/4,carriage_height/2])
				cube([rod_spacing/2,(bearing_od)/2,carriage_height],true);
			translate([0,delta_carriage_offset-platform_thickness/2,carriage_height-platform_thickness/2]) rotate([0,0,90]) intersection (){
				cube([platform_thickness*2,(ball_distance),platform_thickness],true);
				rotate([90,0,0])
					cylinder(h = ball_distance*2, r=platform_thickness,center = true);
			}
		}
		union() {
			hull() for(x = [-rod_spacing/2+16.75,3]) translate([x,0,0]) union() {
				cylinder(h=carriage_height*3,r=10/2,center=true);
				translate([0,-6,0])
					cube([10,12,carriage_height*3],true);
			}

			//Holes for bearings
			translate([rod_spacing/2,0,0])
				cylinder(h=carriage_height*3,r=(bearing_diameter+bearing_dia_clearence)/2,center=true);
			hull() for(x = [-rod_spacing/2-0.75,-rod_spacing/2+0.75])
				translate([x,0,0])
					cylinder(h=carriage_height*3,r=(bearing_diameter+bearing_free_dia_clearence)/2,center=true);

			//Hole for magnets
			/*translate([16,6,platform_thickness])union() {
				cylinder(h=2.5*2,r1=5.4/2,r2=5.4*1.1/2,center=true);
				translate([0,0,1.9]) cylinder(h=2,r1=5.4/2,r2=2/2,center=false);
			}*/

			//Holes for ball links
			translate([0,delta_carriage_offset,carriage_height-platform_thickness/2])
				rotate([-90,0,90])
					nut_well_2(9,ball_distance,carriage_height+1,10,false);

			//Belt clamp
			translate([11,-2.5,carriage_height/2])
				rotate([-90,-90,0])
					translate([-clamp_h/2,1.3,0])
						union() {
							for(x=[0:3:clamp_h])
								translate([x,-0.3,0])
									cylinder(h=7,r=1,center=true);
							translate([-1,-0.8,-7/2])
								cube([clamp_h+2,1.8,7],false);
						}
			translate([11+1.55,-bearing_od/2,carriage_height/2])
				cube([1.5,bearing_od/2,clamp_h+2],true);
			translate([11+1.55,-bearing_od/2,carriage_height/2])
				rotate([0,0,45])
					cube([2.5,2.5,clamp_h+2],true);

			//Screw and nut hole for bearing clamp
			translate([(rod_spacing/2-bearing_radius-3),-bearing_od/2+3,carriage_height/2])
				rotate([-90,0,0])
					nut_cutout(18,0,true);

			//Bearing clamp
			translate([rod_spacing/4+3,0,0])
				cube([rod_spacing/2-19,2,carriage_height*3],true);
		}
	}
}

translate([0,0,carriage_height]) rotate([0,180,0]) new_carriage();

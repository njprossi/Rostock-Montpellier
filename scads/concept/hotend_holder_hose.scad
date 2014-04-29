include <configuration.scad>;

d=platform_dia;
d2=platform_fix_dia;
df=3.2;
//hotend_diameter=12;

module hotend_holder() {
	color("BurlyWood") difference() {
		union() {
			hull(){
				circle(r = d/2);
				rotate([0,0,-60]) translate([0,-30,0]) circle(r = (10+10)/2);
			}
		}
		for(a = [1:3]) rotate([0,0,a*120-60]){
			translate ([0,d2/2,0]) rotate([0,0,a*60+60]) hull() for(x=[-0.5:0.5]) translate ([x,0,0]) circle(r = df/2);
			//translate ([0,15,0]) circle(r = 2);
			//translate ([0,5,0]) square ([4,20],center = true);
		}
		//for(a = [1:2])rotate([0,0,-a*120-180]) translate ([0,d2/2,0]) rotate([0,0,a*120+180]) translate ([0,d2/2,0]) square([df,d2],center = true);
		//translate ([0,d/4,0]) square([4,d/2+1],center = true);
		circle(r = hotend_groove_dia/2);
		translate ([0,7,0])rotate([0,0,45]) square([d,d],center = false);
		translate ([0,d/2,0])square([(hotend_groove_dia-1),d],center = true);
		rotate([0,0,-60]) translate([0,-30,0]) rotate([0,0,180]) {
	
			circle(r = 9.5/2);
			translate ([0,2,0])rotate([0,0,45]) square([d,d],center = false);
			translate ([0,d/2,0])square([8.5,d],center = true);
		}
	}
}

hotend_holder();
translate ([30,0,0]) union() {
circle(r=hotend_diameter/2);
translate ([-hotend_diameter/2,0,0])square([hotend_diameter,d/2],center = false);
}

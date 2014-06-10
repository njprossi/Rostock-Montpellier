include <../configuration.scad>;

d=platform_dia;
d2=platform_fix_dia;
df=3.2;
//hotend_diameter=12;

module hotend_holder() {
	color("BurlyWood") difference() {
		circle(d = d);

		for(a = [1:3]) rotate([0,0,a*120-60])
			translate ([0,d2/2,0])
				rotate([0,0,a*150+150])
					hull()
						for(x=[-0.5:0.5])
							translate ([x,0,0])
								circle(r = df/2);

		circle(d = hotend_groove_dia);

		translate([0,7,0])
			rotate([0,0,45])
				square([d,d],center = false);

		translate([0,d/2,0])
			square([(hotend_groove_dia-1),d],center = true);

	}
}

hotend_holder();

*translate ([30,0,0]) union() {
	circle(r=hotend_diameter/2);
	translate ([-hotend_diameter/2,0,0])
		square([hotend_diameter,d/2],center = false);
}

include <../configuration.scad>;
use <../library/plate.scad>

$fa=.2;$fs=.1;

module top_plate()
{
	difference() {
		hull() plate_pattern(delta_smooth_rod_offset-frame_roundness-rod_diameter/2, rod_spacing+rod_diameter, frame_roundness);
		plate_pattern(delta_smooth_rod_offset-12, rod_spacing, 4.5/2);
		hull() plate_pattern(delta_smooth_rod_offset-frame_roundness-rod_diameter/2-40, rod_spacing-20, frame_roundness/2);
	
	for(a=[0,120,240]) rotate([0,0,a])
			translate([-15,delta_smooth_rod_offset-15,0])
				rotate([0,0,15]) hull()
					for(x=[-3,3]) translate([x,0,0])
						circle(2);
	}
}

top_plate();
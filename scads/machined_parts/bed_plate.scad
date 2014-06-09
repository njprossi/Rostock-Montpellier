include <../configuration.scad>;
use <../library/plate.scad>

$fa=.2;$fs=.1;

module bed_plate()
{
	difference() {
		hull() plate_pattern(delta_smooth_rod_offset-frame_roundness-rod_diameter/2, rod_spacing+rod_diameter, frame_roundness);
		plate_pattern(delta_smooth_rod_offset-12, rod_spacing, 4.5/2);
		for(a=[20:120:360]) rotate([0,0,a]) translate([0,printbed_diameter/2+10,0]) circle(d=4.2);
	}
}

bed_plate();
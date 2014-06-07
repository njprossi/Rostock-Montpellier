include <../configuration.scad>;
use <../library/plate.scad>

$fa=.2;$fs=.1;

module top_plate()
{
	difference() {
		hull() plate_pattern(delta_smooth_rod_offset-frame_roundness-rod_diameter/2, rod_spacing+rod_diameter, frame_roundness);
		plate_pattern(delta_smooth_rod_offset-rod_diameter/2-12, rod_spacing, 4.5/2);
		hull() plate_pattern(delta_smooth_rod_offset-frame_roundness-rod_diameter/2-40, rod_spacing-20, frame_roundness/2);
	}
}

top_plate();
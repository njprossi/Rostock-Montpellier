include <../configuration.scad>;
use <../library/plate.scad>

$fa=.2;$fs=.1;

module base_plate()
{
	difference() {
		hull() plate_pattern(delta_smooth_rod_offset-frame_roundness-rod_diameter/2, rod_spacing+rod_diameter, frame_roundness);
		plate_pattern(delta_smooth_rod_offset-12, rod_spacing, 4.5/2);
		plate_pattern(delta_smooth_rod_offset-48, rod_spacing, 4.5/2);
	}
}

base_plate();
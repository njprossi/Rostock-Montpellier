include <../configuration.scad>;
use <../standard_parts/board.scad>;
use <../library/plate.scad>

$fa=.2;$fs=.1;

module base_plate()
{
	difference() {
		hull() plate_pattern(delta_smooth_rod_offset-frame_roundness-rod_diameter/2, rod_spacing+rod_diameter, frame_roundness);
		//Motor end holes
		plate_pattern(delta_smooth_rod_offset-12, rod_spacing, 4.5/2);
		plate_pattern(delta_smooth_rod_offset-48, rod_spacing, 4.5/2);

		//Fans holder holes
		translate([0,-(delta_smooth_rod_offset*1/3)/(2/3)-(rod_spacing+rod_diameter)*sqrt(3)/4+frame_roundness-10,0])
			for(x=[-40,40]) translate([x,0,0])
				circle(4.5/2);

		//Holes for diagonal rods assembly
		for(y=[0,-delta_diagonal_rod]) translate([0,y+delta_smooth_rod_offset-12,0])
				circle(3.1/2);

		translate([motherboard_x,motherboard_y,0]) rotate([0,0,180]) ramps_cutout();
	}
}

base_plate();
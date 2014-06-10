include <../configuration.scad>;
use <../printed_parts/effector.scad>;
use <../printed_parts/bowden_holder.scad>;
use <../standard_parts/ball.scad>;
use <../standard_parts/screw.scad>;
use <../machined_parts/hotend_holder.scad>;
use <../standard_parts/E3D_hot_end.scad>;
use <../standard_parts/tube.scad>;
use <arm.scad>;


module effector_asm() {

	rotate([0,180,0])
		new_effector();
	
	//Screws
	for(a = [60:120:360]) rotate([0,0,a])
		translate([0,platform_fix_dia/2,-platform_thickness/2-hotend_groove_h])
			chc_m3(20);
	
	//Bowden holder
	%translate([0,0,platform_thickness/2+2.5])
		rotate([0,180,60])
			bowden_holder();
	
	//Arms
	for(a = [60:120:360]) rotate([0,0,a]) {
		for(b = [-1,1]) {
			translate([b*(ball_distance)/2,-delta_effector_offset,0])
				rotate([30,0,b*90+90])
					ball();
			translate([b*(ball_link_distance)/2,-delta_effector_offset,0])
				rotate([90-diagonal_rod_angle,0,0])
					arm();
		}
	}
	
	//Hotend
	translate([0,0,-3-platform_thickness/2-hotend_groove_h])
		E3D_hot_end();
	
	//Hotend holder
	translate([0,0,-(platform_thickness+hotend_groove_h)/2])
		linear_extrude(height = hotend_groove_h, center = true)
			hotend_holder();

	tube(4,2.5,40);
}

effector_asm();


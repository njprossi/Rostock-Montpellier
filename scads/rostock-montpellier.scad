include <configuration.scad>;
include <MCAD/stepper.scad>;
use <assembly/column.scad>;
use <assembly/effector_asm.scad>;
use <printed_parts/fan_mount.scad>;
use <build_volume.scad>;
use <standard_parts/fan.scad>;
use <standard_parts/board.scad>;
use <machined_parts/base_plate.scad>;
use <machined_parts/bed_plate.scad>;
use <machined_parts/top_plate.scad>;

show_build_volume = false;

//Effector assembly
translate([0,0,-carriage_altitude-2*frame_thickness-motor_end_height+rod_length-frame_thickness-idler_end_height-(24-carriage_height)/2-platform_thickness/2])
	effector_asm();

//Columns
for (a=[60:120:300]) rotate([0,0,a]) {
	translate([0,-delta_smooth_rod_offset,-2*frame_thickness-motor_end_height]) column();
}

//Build volume
if (show_build_volume == true) {
	build_volume(spacing-28-23.5,73.5,ball_angle*2);
	//color("Red",.5) cylinder(200,100,100,false);
	//color("Blue",.5) cylinder(170,printbed_diameter/2,printbed_diameter/2,false);
	//color("Red") circle(printbed_diameter/2);
}

//Extruder motor
translate([-65,30,-frame_thickness-motor_end_height/2]) rotate([90,0,0]) {
	motor(Nema17, NemaMedium, dualAxis=false);
	//5:1 Planetary Gearbox
	rotate([180,0,0]) color("Silver") union(){
		translate([0,0,2.5]) cube([42.3,42.3,5],true);
		cylinder(r=20,h=27.3);
		translate([0,0,27.3]) {
			cylinder(r=11,h=2);
			cylinder(r=4,h=20);
		}
	}
}


//Fans (of Jeremie F.)
translate([0,-95,0]) union() {
	translate([0,0,-30])rotate([-90,0,0]) fan_mount();
	for(x=[-40.5,0,40.5])
		translate([-20+x,-10,-10])
			rotate([-90,0,0])
				40mm_fan();
}
//translate([60,40,-6-44]) rotate([0,0,0]) 76mm_turbine();

//Boards
translate([30,18,-frame_thickness-motor_end_height/2]) rotate([0,0,180]) ramps();
//translate([0,-30,-6-32]) rotate([0,0,0]) printrboard();

//Frame plates
translate([0,0,-frame_thickness]) color("LightCyan",0.5)
	linear_extrude(frame_thickness) bed_plate();

translate([0,0,-2*frame_thickness-motor_end_height]) color("LightCyan",0.5)
	linear_extrude(frame_thickness) base_plate();

translate([0,0,rod_length-3*frame_thickness-motor_end_height]) color("LightCyan",0.5)
	linear_extrude(frame_thickness) top_plate();
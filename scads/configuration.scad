$fa = 2;
$fs = 0.5;

motor_end_height=44;
idler_end_height=28;
carriage_height=13.8;
platform_thickness=10;
platform_fix_dia=28;
platform_dia=38;

bearing_diameter=16;
bearing_dia_clearence=0.5;
bearing_free_dia_clearence=0.8;

hotend_diameter=16.4;
hotend_groove_dia=12;

// Frames

// Places mounting holes for the controller
// 33 = RAMPS 1.3 (Power outputs: Extruder, Bed, Fan)
// 34 = RAMPS 1.3 (Power outputs: Extruder0, Extruder1, Bed)
// 35 = RAMPS 1.3 (Power outputs: Extruder, Fan, Fan)
// 70 = Megatronics
// 701 = Megatronics 2.0

motherboard=35;

frame_thickness=8;

// Distance from motor axle to idler axle
// Calculated regarding length of the HTD3M closed belt 
belt_tooth=354;
spacing = round(((belt_tooth*3) - 3.14159 * 24.83) / 2);

rod_length=spacing+55;
rod_diameter=8;
//platform_hinge_offset=25;
//carriage_hinge_offset=17;

printbed_diameter=170;	//printable aera
printbed_thickness=4;		// used for rendering and approximating build volume


//corner_radius=12;
//frame_radius=(tower_radius-rod_diameter/2-corner_radius)/cos(30);

ball_link_distance=40;//55;
ball_offset=6.5;
ball_distance=ball_link_distance-2*ball_offset;
ball_angle=25;

// Delta Settings

delta_smooth_rod_offset=139.5;//140 - 152 floor(printbed_diameter/(2*sin(ball_angle))-printbed_diameter/2+delta_effector_offset+delta_carriage_offset)
delta_effector_offset=18;
delta_carriage_offset=18;
delta_diagonal_rod=ceil(max(printbed_diameter/2+delta_smooth_rod_offset-delta_effector_offset-delta_carriage_offset,printbed_diameter/(2*sin(ball_angle))));
//|-> 202
delta_radius=(delta_smooth_rod_offset-delta_effector_offset-delta_carriage_offset);

diagonal_rod_length=delta_diagonal_rod-2*8;//165
diagonal_rod_diameter=3;
diagonal_rod_length_lost=(printbed_diameter/(2*sin(ball_angle)))-(printbed_diameter/2+delta_smooth_rod_offset-delta_effector_offset-delta_carriage_offset);

diagonal_rod_angle=acos(delta_radius/delta_diagonal_rod);

echo_result=true;

carriage_altitude=sqrt(pow(delta_diagonal_rod,2)-pow(delta_radius,2));



if(echo_result) {
	echo("printbed_diameter",printbed_diameter);
	echo("delta_diagonal_rod",delta_diagonal_rod);
	echo("diagonal_rod_length",diagonal_rod_length);
	echo("delta_effector_offset",delta_effector_offset);
	echo("delta_carriage_offset",delta_carriage_offset);
	echo("delta_radius",delta_radius);
	echo("diagonal_rod_angle",diagonal_rod_angle);
	echo("carriage_altitude",carriage_altitude);
	echo("diagonal_rod_length_lost",diagonal_rod_length_lost);
	echo("delta_smooth_rod_offset_optimum",printbed_diameter/(2*sin(ball_angle))-printbed_diameter/2+delta_effector_offset+delta_carriage_offset);
	echo("rod_length",rod_length);
}

$fa = 3;
$fs = 1;

//Printed parts
motor_end_height=44;
idler_end_height=28;
carriage_height=13.8;
platform_thickness=10;
platform_fix_dia=28;
platform_dia=38;

//Standard parts
bearing_diameter=16;
bearing_height=24;
bearing_dia_clearence=0.5;
bearing_free_dia_clearence=0.8;

hotend_diameter=16.4;
hotend_groove_dia=12;
hotend_groove_h=6;

ball_link_distance=40; //Distance between two balls on carriage
ball_offset=6.5;
ball_distance=ball_link_distance-2*ball_offset;
ball_angle=25;
ball_link_offset=8; //Distance between ball center and diagonal rod

// Frames
// RAMPS = 1
motherboard=1;

ramps_x=100;
ramps_y=50;

rumba_x=88;
rumba_y=50;

frame_thickness=8;
frame_roundness=20;

// Distance from motor axle to idler axle
// Calculated regarding length of the HTD3M closed belt 
//belt_length=882;
belt_length=1062;
//belt_length=1245;
belt_step=3;
pulley_tooth=26;
idler_diameter=22;
spacing = round((belt_length - belt_step*pulley_tooth/2 - idler_diameter*PI/2) / 2);

rod_length=spacing+motor_end_height/2+idler_end_height/2+2*frame_thickness;
rod_diameter=8;
rod_spacing=60; // Distance of 60mm is compatible with Rostock
//platform_hinge_offset=25;
//carriage_hinge_offset=17;

printbed_diameter=170;	//printable aera
//printbed_diameter=250;	//printable aera
printbed_thickness=4;		// used for rendering and approximating build volume


// Delta Settings
delta_smooth_rod_offset=139.5;
//delta_smooth_rod_offset=139.5+49;
delta_effector_offset=18;
delta_carriage_offset=18;
delta_diagonal_rod=ceil(max(printbed_diameter/2+delta_smooth_rod_offset-delta_effector_offset-delta_carriage_offset,printbed_diameter/(2*sin(ball_angle))));
delta_radius=(delta_smooth_rod_offset-delta_effector_offset-delta_carriage_offset);

diagonal_rod_length=delta_diagonal_rod-2*ball_link_offset;
diagonal_rod_diameter=3;

diagonal_rod_angle=acos(delta_radius/delta_diagonal_rod);

carriage_altitude=sqrt(pow(delta_diagonal_rod,2)-pow(delta_radius,2)); //Height between effector and carriage from ball center

echo_result=true;

if(echo_result) {
	echo("printbed_diameter",printbed_diameter);
	echo("delta_diagonal_rod",delta_diagonal_rod);
	echo("diagonal_rod_length",diagonal_rod_length);
	echo("delta_effector_offset",delta_effector_offset);
	echo("delta_carriage_offset",delta_carriage_offset);
	echo("delta_radius",delta_radius);
	echo("diagonal_rod_angle",diagonal_rod_angle);
	echo("carriage_altitude",carriage_altitude);
	echo("rod_length",rod_length);
  echo("axle_spacing",spacing);
}

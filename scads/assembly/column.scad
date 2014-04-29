include <../configuration.scad>;
include <MCAD/stepper.scad>;
include <MCAD/bearing.scad>;
include <MCAD/materials.scad>;
use <../printed_parts/carriage.scad>;
use <../legacy/idler_end.scad>;
use <../standard_parts/ball.scad>;
use <../standard_parts/Pulley_Motor_HTD3_26-tooth.scad>;
use <../standard_parts/rod.scad>;
use <../standard_parts/endstop.scad>;
use <../standard_parts/screw.scad>;
use <../standard_parts/belt.scad>;
use <../legacy/carriage.scad>;
use <../legacy/motor_end.scad>;


module column(){

//Belt
translate([0,-2.5,-6-22]) rotate([0,0,0]) belt(spacing);

//Screw
for(x=[1]) translate([x*(30-bearing_diameter/2-3),-9.5,carriage_height/2+spacing-28-32.5]) rotate([-90,0,0]) chc_m3(20);

//Motor
translate([0,4+5,-28]) rotate([-90,0,0]) motor(Nema17, NemaLong, dualAxis=false);

//Motor end
color("orange") translate([0,0,-52]) motor_end();

//Carriage
//%rotate([0,180,180]) carriage();
translate([0,0,spacing-28-32.5]) rotate([0,0,0]) new_carriage();

//Ball links
for(b = [-1,1]) translate([b*(ball_distance)/2,delta_carriage_offset,spacing-28-23.5]) rotate([30,0,b*90+90]) ball(false);

//Linear Bearing
color("gold") for(x = [-1,1]) translate([x*30,0,spacing-28-26]) difference() {
	cylinder(h=24,r=bearing_diameter/2,center=true);
	cylinder(h=26,r=8/2,center=true);
}

//Skate Bearing
color("silver") translate([0,-4-2+7/2,spacing-28]) rotate([90,0,0]) bearing(model=SkateBearing, outline=false, material=Steel);

//Idler end
color("orange") translate([0,0,spacing-28-14]) idler_end();

//Stop
//translate([-30,12,16]) rotate([0,180,0]) stop();

//Smooth rod
for(b = [-1,1]) translate([b*30,0,-55]) rod(rod_length,rod_diameter);

//Endstop
//translate([0,7.5,6]) rotate([0,180,0]) endstop();
//translate([-17.5,11.5,6]) rotate([0,180,180]) endstop();
}
column();
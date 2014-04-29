//User Defined Features

//"THE BEER-WARE LICENSE" (Revision 42):
//<https://github.com/njprossi> wrote this file. As long as you retain this notice you
//can do whatever you want with this stuff. If we meet some day, and you think
//this stuff is worth it, you can buy me a beer in return.
//Nicolas Rossi

//Currently only for M3

nh=2.8;		//Nut height
ns=5.6;		//Nut 
sd=3.5;		//Screw main dia
shd=5.5;		//Screw head dia
shh=3.5;		//Screw head height

dr=1.1;		//Draft %

$fn=16;

module nut_well(length,position,height,angle,counterbore=false) {
	union() {
		translate([0,0,position+nh/2]) rotate([0,90,90+angle]) hull() {
			rotate([0,90,0]) cylinder(h=nh,r=ns/(sqrt(3)),center=true,$fn=6);
			translate([0,0,height+1]) cube([nh*dr,ns*dr,1],true);
		}
		reprap_hole(sd,length,true);
	}
	if (counterbore==true) counterbore(shh,shd);
}

module nut_well_2(length,distance,height,angle,counterbore=false) {
	union() {
		translate([0,0,-distance/2])reprap_hole(sd,distance+2,false);
		rotate([0,0,angle]) hull() for(a=[0,180]) rotate([0,a,0]) translate([0,0,-distance/2+length-nh]) rotate([0,0,90]) cylinder(h=nh,r1=ns/(sqrt(3)),r2=ns*dr/(sqrt(3)),center=false,$fn=6);
		rotate([0,0,angle]) translate([0,height/2,0]) cube([ns*dr,height,distance-2*length],true);
	}
	if (counterbore==true) counterbore(shh,shd);
}

module nut_cutout(length,angle,counterbore=false){
	reprap_hole(sd,length-1,false);
	translate([0,0,length]) rotate([0,0,90+angle]) cylinder(h=nh*2,r1=ns/(sqrt(3)),r2=ns*dr/(sqrt(3)),center=true,$fn=6);
	if (counterbore==true) counterbore(shh,shd);
}
module nut_cutout_2(length,angle,counterbore=false,overhang=false){
	translate([0,0,length/2-1]) cylinder(h=length+2, r=sd/2, center=true);
	translate([0,0,length]) rotate([0,0,90+angle]) cylinder(h=nh*2, r2=ns*dr/sqrt(3), r1=ns/sqrt(3), center = true,$fn=6);
	if (overhang==true) translate([0,0,length-nh-ns/4+.1]) cylinder(h=ns/2, r2=ns/2, r1=0, center = true);
	if (counterbore==true) counterbore(shh,shd);
}

module counterbore(h,d){
	translate([0,0,-h]) cylinder(h=h*2,r1=(d*dr)/2,r2=d/2,center=true,$fn=16);
}

module reprap_hole(diameter,length,sphere=false) {
		translate([0,0,length/2-1]) hull(){
			cylinder(h=length+2,r=diameter/2,center=true,$fn=16);
			translate([0,0,-length/2-1]) rotate([90,0,135]) cube([diameter/2,length+2,diameter/2],false);
			if (sphere==true) translate([0,0,length/2+1]) sphere(r=diameter/2,$fn=16);
		}
}

/* Test
difference() {
	translate([10,0,0])cube([20,10,10],true);
	nut_well(12,5,5,0);
	nut_cutout(12);
}
*/


translate([-10,0,5]) cube([5,5,10],true);
nut_well(10,6,5,0,true);
translate([10,0,0]) nut_well_2(10,40,5,15,false);
translate([20,0,0]) nut_cutout(10,0,true);
translate([30,0,0]) nut_cutout_2(10,0,true,true);
translate([40,0,0]) reprap_hole(5,10,true);


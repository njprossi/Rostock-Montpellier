$fa=1;
$fs=.5;

cl=0.2;
l=36-2*cl;
w=30-2-2.5-2*cl;
d=-3;
r1=4.5-cl;
r2=2.5-cl;
th=.8;

od=11;
id=0;
t=8;
//od=15;
//t=10;

h=80;

brim=true;
//brim=false;
xsec=false;
//xsec=true;

module orifice(r1a,r1b,r2a,r2b,h) {
	hull() {
		for(x=[-w/2+r1,w/2-r1]) translate([x,l/2-r1,0]) cylinder(h,r1a,r1b,false);
		for(x=[-w/2+r2,w/2-r2]) translate([x,-l/2+r2,0]) cylinder(h,r2a,r2b,false);
	}
}

module funnel() {
	hull() {
		orifice(r1-th,r1+.3-th,r2-th,r2+.3-th,7);
		hull() {
			for(y=[-(od+th)/2,(od+th)/2]) translate([0,y+d,h-21]) cylinder(1,od/2,od/2,false);
		}
	}
}

difference() {
	union() {
		minkowski() {
			union() {
				funnel();
				for(y=[-(od+th)/2,(od+th)/2]) translate([0,y+d,0]) cylinder(h,od/2,od/2,false);
					hull() for(y=[-(od+th)/2,(od+th)/2]) translate([0,y+d,h-20]) cylinder(5,od/2,0,false);
			}
			sphere(th);
		}

		//Brim
		if(brim==true) orifice(r1+5,r1+5,r2+5,r2+5,.2);
	}
	funnel();
	hull() for(y=[-(od+th)/2,(od+th)/2]) translate([0,y+d,h-20]) cylinder(5,od/2,0,false);
	for(y=[-(od+th)/2,(od+th)/2]) {
		translate([0,y+d,h-20]) cylinder(10,od/2,t/2,false);
		translate([0,y+d,h-10]) cylinder(15,od/2-.3,od/2,false);
	}
	translate([0,0,-2]) orifice(r1+2,r1-2,r2+2,r2-2,4);
	translate([0,0,-2]) cube([2*w,2*l,4],true);
	//cylinder(100,(t-2)/2,(t-2)/2,false);
	translate([0,0,h])cylinder(10,20,20,false);

	if (xsec==true) rotate([0,0,90]) translate([0,0,-50]) cube([l,w*2,h*2],false);
}
//cube([w-r1-r2,l-r1-r2,2],true);
//color("Black") translate([w/2-0.75,0,2.25]) rotate([90,0,0]) cylinder(10,2.5/2,2.5/2,true);

//translate([0,-150,0]) rotate([-15,0,0]) cube(100,false);

// To do : get fixing points
inch = 25.4;

ramps_fix_point= [[(0.25+0.55)*inch,(0.25+0.1)*inch,0],
				 		[(0.25+0.6)*inch,	(0.25+2)*inch,0],
				 		[(0.25+2.6)*inch,	(0.25+0.3)*inch,0],
				 		[(0.25+2.6)*inch,	(0.25+1.4)*inch,0],
				 		[(0.25+3.55)*inch,(0.25+2)*inch,0],
				 		[(0.25+3.8)*inch,	(0.25+0.1)*inch,0]];

module ramps() {
	color("Blue") difference() {
		translate([0.25*inch,0.25*inch,0]) union() {
			cube([4*inch,2.1*inch,0.6*inch]);
			translate([-0.25*inch,1.275*inch,0.1*inch])
				cube([1*inch,0.5*inch,0.5*inch]);
			translate([-0.075*inch,0.125*inch,0.1*inch])
				cube([1*inch,0.3*inch,0.3*inch]);

		}
		for(i=[0:5]) translate(ramps_fix_point[i])
			cylinder(d=3.5,h=10,center=true);
	}
	color("Green") translate([0.25*inch,0,0.6*inch]) cube([4*inch,2.35*inch,20]);
}

module ramps_cutout(){
	for(i=[0:5]) translate(ramps_fix_point[i])
		circle(d=3.5);
}

module rumba() {
	color("White") cube([135,70,20]);
}

module printrboard() {
	color("DimGrey") cube([100,60,20]);
}

module smoothieboard() {
	color("black") cube([105,105,20]);
}

ramps();
translate ([0,100,0,]) rumba();
translate ([0,200,0,]) printrboard();
translate ([0,300,0,]) smoothieboard();

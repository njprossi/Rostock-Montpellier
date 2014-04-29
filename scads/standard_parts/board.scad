// To do : get fixing points

module ramps() {
	color("Green") cube([5.25*25.4,2.45*25.4,44],true);
}

module rumba() {
	color("White") cube([135,70,20],true);
}

module printrboard() {
	color("DimGrey") cube([100,60,20],true);
}

module smoothieboard() {
	color("black") cube([105,105,20],true);
}

ramps();
translate ([0,100,0,]) rumba();
translate ([0,200,0,]) printrboard();
translate ([0,300,0,]) smoothieboard();

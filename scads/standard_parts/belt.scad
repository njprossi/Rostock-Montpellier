//HTD3 belt

module belt(length) {
	color("dimgrey") rotate([90,0,0])difference() {
		hull() for (y=[0,length]) translate([0,y,0]) cylinder(h=6,r=22/2+2.5,center=true);
		hull() for (y=[0,length]) translate([0,y,0]) cylinder(h=10,r=22/2,center=true);
	}
}

belt(435);

module plate_pattern(radius,distance,roundness) {
	for(a=[0,120,240])
		rotate([0,0,a+90])
			for(d=[-1,+1])
				translate([radius,d*distance/2,0])
					circle(r=roundness);
}

plate_pattern(100,60,10);
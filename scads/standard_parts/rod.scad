module rod(length,diameter) {
	color("silver") cylinder(length,diameter/2,diameter/2,false);
}

rod(500,8);
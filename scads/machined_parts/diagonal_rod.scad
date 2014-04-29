include <../configuration.scad>

echo("diagonal rod length",diagonal_rod_length);
diagonal_rod();

module diagonal_rod() {
	color("dimgray") translate([0,0,diagonal_rod_length/2]) cylinder(h = diagonal_rod_length, r = diagonal_rod_diameter/2, center = true, $fn = 8);
}
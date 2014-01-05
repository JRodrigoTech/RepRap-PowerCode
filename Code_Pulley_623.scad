// Created from Code_Pulley_623 (x4).stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

difference () {
	union() {
		cylinder (h = 0.5, r = 9, $fn=100);

		translate([0, 0, 0.5])
		cylinder(h = 1, r1 = 9, r2 = 6.2, $fn=100);

		translate([0, 0, 1.5])
		cylinder (h = 3, r = 6.2, $fn=100);
	}	
	union() {
		translate([0, 0, -1])
		cylinder (h = 3, r = 3, $fn=100);

		translate([0, 0, 1.9])
		cylinder (h = 3, r = 5.15, $fn=100);
	}	
 
}
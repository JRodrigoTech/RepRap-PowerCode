// Created from Code_Diagonal (x2).stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

module pieza(){
	difference () {
		union() {
			translate([0, -23, 0])
			cube([5, 23, 32]);

			translate([0, -6, 0])
			cube([23, 6, 32]);

			translate([5, -8, 0])
			cube([2, 2, 32]);

			translate([0, -5, 0])
			cylinder(h = 32, r = 5, $fn=100);
		}	
		union() {
			translate([-5, -10, -1])
			cube([5, 5, 34]);

			translate([7, -8, -1])
			cylinder(h = 34, r = 2, $fn=100);

			translate([23, -7, 10.55])
			rotate( 38, [0, -1, 0])
			cube([18, 8, 34]);

			translate([-1, -14.66, 20])
			rotate( 90, [0, 1, 0])
			cylinder(h = 7, r = 3.2, $fn=100);

			translate([14.67, 1, 8])
			rotate( 90, [1, 0, 0])
			cylinder(h = 8, r = 3.2, $fn=100);
		}	
 
	}
}

// Pieza normal
translate([0, 30, 0])
pieza();

// Pieza espejo
translate([0, -30, 0])
mirror([ 0, 1, 0 ]) 
pieza();
// Created from Code_Zbotton.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

module pieza(){
	difference () {
		union() {
			cube([8, 45, 33]);

			cube([53.5, 50, 6]);

			translate([0, 45, 0])
			cube([40, 5, 33]);

			translate([8, 0, 6])
			cube([2, 45, 2]);

			translate([0, 45, 0])
			cylinder(h = 33, r = 5, $fn=100);
		}	
		union() {
			translate([-5, 40, -1])
			cube([5, 5, 35]);

			translate([20, -1, -1])
			cube([34, 23.5, 8]);

			translate([34, 20.5, -1])
			cube([20, 12, 8]);

			translate([43.5, 50, -1])
			rotate( -45, [0, 0, 1])
			cube([15, 8, 8]);

			translate([-1, 0, 13])
			rotate( 53.13, [1, 0, 0])
			cube([10, 26, 14]);

			translate([40, 44, 6])
			rotate( -49.84, [0, 1, 0])
			cube([22, 7, 43]);

			translate([32, 22.5, -1])
			cylinder(h = 8, r = 12, $fn=100);

			translate([10, -1, 8])
			rotate( -90, [1, 0, 0])
			cylinder(h = 46, r = 2, $fn=100);

			translate([16.5, 7, -1])
			cylinder(h = 8, r = 1.7, $fn=100);

			translate([47.5, 38, -1])
			cylinder(h = 8, r = 1.7, $fn=100);

			translate([32, 39.55, -1])
			cylinder(h = 8, r = 4.05, $fn=100);

			translate([31.5, 33.5, -1])
			cube([1, 3, 6]);

			translate([5.5, 22, 13])
			union() {
				cube([20, 6.8, 6.8], center = true);
				rotate( 90, [0, 1, 0])
				cylinder(h = 10.5, r = 10, $fn=100);
			}
		}	
 
	}
}

// Pieza normal
translate([0, 8, 0])
pieza();

// Pieza espejo  
translate([0, -8, 0])
mirror([ 0, 1, 0 ]) 
pieza();   

// Created from Code_Ztop.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

module pieza(){
	difference () {
		union() {
			cube([12, 40, 24]);

			translate([0, 21, 0])
			cube([45, 19, 5]);

			translate([0, 35, 0])
			cube([37, 5, 24]);
		}	
		union() {
			translate([37, 29.5, -1])
			cylinder(h = 7, r = 4.05, $fn=100);

			translate([36.5, 23.5, 1])
			cube([1, 3, 5]);

			translate([15, 21, -1])
			cylinder(h = 7, r = 3, $fn=100);

			translate([15, 20, -1])
			cube([31, 4, 7]);

			translate([9, 17, 15])
			union() {
				cube([20, 6.8, 6.8], center = true);
				rotate( 90, [0, 1, 0])
				cylinder(h = 4, r = 9, $fn=100);
			}

			translate([9, 13.6, 22])
			cube([4, 8, 3]);

			translate([-1, -1, 5])
			cube([6, 32, 20]);

			translate([-1, 30, 9])
			cube([6, 11, 16]);

			// Chaflanes
			translate([4, 0, 14])
			rotate( 90 ,[0, 1, 0])
			rotate( 135 ,[0, 0, 1])
			cube([15, 8, 9]);

			translate([-1, 31, 5])
			rotate( 90 ,[0, 1, 0])
			rotate( 135 ,[0, 0, 1])
			cube([6, 6, 6]);

			translate([0, 40, 9])
			rotate( 90 ,[0, 1, 0])
			rotate( 135 ,[0, 0, 1])
			cube([12, 22, 34]);

			translate([37, 41, 5])
			rotate( 90 ,[1, 0, 0])
			rotate( 45 ,[0, 0, 1])
			cube([15, 22, 7]);

			translate([7, 0, -1])
			rotate( -45 ,[0, 0, 1])
			cube([4, 7, 21]);

			translate([42, 24, -1])
			rotate( -45 ,[0, 0, 1])
			cube([8, 12, 7]);

			translate([45, 35, -1])
			rotate( 45 ,[0, 0, 1])
			cube([6, 8, 7]);
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
// Created from Code_Ycorner (x3).stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

// Pieza y las operaciones
difference () {
		translate([0, 0, 0])
		cube([20, 30, 16]);	
	union() {
		// Zona Cilindrica
		translate([4.7, 22.5, -1])
		cube([10.6, 8, 18]);

		translate([10, 22.5, -1])
		rotate( 90, [0, 0, 1])
		cylinder(h = 18, r = 5.3, $fn=100);

		translate([10, 19.08, 3.41])
		rotate(-33.75, [1,0,0])
		cylinder(h = 16, r = 5.3, center=true , $fn=100);
		translate([10, 25.38, 3.41])
		rotate(-33.75, [1,0,0])
		cube([10.6, 10.6, 18], center=true);

		// Zona plana
		translate([-1, 6, 6])
		rotate(55, [1,0,0])
		cube([22, 15, 8]);

		translate([-1, -1, 6])
		cube([22, 7, 11]);

		translate([3, 3.5, -1])
		cube([14, 2.5, 8]);

		translate([7, -1, -1])
		cube([6, 2, 8]);

		translate([7, 1, -1])
		rotate(225, [0,0,1])
		cube([2, 2, 8]);

		translate([13, 1, -1])
		rotate(225, [0,0,1])
		cube([2, 2, 8]);

	}	
}

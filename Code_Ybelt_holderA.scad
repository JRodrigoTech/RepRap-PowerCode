// Created from Code_Ybelt_holderA.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

// Media Pieza
module mpieza(){
	cube([18.5, 7, 16]);

	translate([11, 0, 0])
	cube([7.5, 15, 16]);

	translate([12.5, -4.355, 0])
	cube([4, 4.355, 16]);

	translate([11.5, -4.355, 0])
	rotate( 90, [0, 0, 1])
	cylinder(h = 16, r = 5, $fn=100);
}

// Operaciones para media pieza
module moperaciones(){
	translate([0, -1, 8])
	rotate( -90, [1, 0, 0])
	cylinder(h = 9, r = 3.29, $fn=100);
	
	translate([14.75, 15, -1])
	rotate( 90, [0, 0, 1])
	cylinder(h = 18, r = 1, $fn=100);

	translate([6.5, -5, -1])
	cube([6, 5, 18]);

	translate([12.5, -5, -1])
	rotate( 120, [0, 0, 1])
	cube([4, 6, 18]);

	translate([12, -5.288, -1])
	rotate( 200, [0, 0, 1])
	cube([5, 4, 18]);
}

// Generamos la pieza y las operaciones
difference () {
	union() {
		mpieza();

		mirror([ 1, 0, 0 ])
		mpieza();
	}	
	union() {
		moperaciones();

		mirror([ 1, 0, 0 ])
		moperaciones();
	}	
}

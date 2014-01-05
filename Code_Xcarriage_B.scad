// Created from Code_Xcarriage_B.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

// Pieza y las operaciones
difference () {
	union() {
		//Cubo base
		translate([0, 0, 0])
		cube([6.5, 17, 9.4]);	
		//Saliente
		translate([6.5, 0, 0])
		cube([3, 1.5, 9.4]);
		translate([6.5, 1.5, 0])
		cube([2, 1, 9.4]);
		//Redondeo del saliente
		translate([8.5, 1.5, 0])
		cylinder(h = 9.4, r = 1, $fn=100);
		//Muescas
		translate([8, 2.5, 2.5])
		rotate( -135, [0, 1, 0])
		cube([3, 14.5, 3]);
		translate([8, 2.5, 6.5])
		rotate( -135, [0, 1, 0])
		cube([3, 14.5, 3]);
}
	union() {
		//Taladro pequeño
		translate([-1, 6, 4.7])
		rotate( 90, [0, 1, 0])
		cylinder(h = 10, r = 1.8, $fn=100);
		//Taladro grande
		translate([-1, 6, 4.7])
		rotate( 90, [0, 1, 0])
		cylinder(h = 4, r = 2.9, $fn=100);
	}	
}

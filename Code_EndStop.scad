// Created from Code_EndStop (x2).stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

// Media Pieza
module mpieza(){
	translate([0, 3, 0])
	cube([9, 27, 10]);

	translate([6, 3, 0])
	cylinder(h = 10, r = 3, $fn=100);

	translate([1.5, 0, 0])
	cube([4.5, 3.9, 10]);
}

// Operaciones para media pieza
module moperaciones(){
	// Parte 1
	translate([0, 2.798, -1])
	cube([1.5, 4, 7]);

	translate([0, 2.798, 5])
	cube([6.8, 5.8, 6]);

	translate([0, 3.9, -1])
	cube([6.8, 3.5, 7]);

	translate([5.8, 8.5298, 5])
	cylinder(h = 6, r = 1, $fn=100);

	// Parte 2
	translate([0, 19, -1])
	cylinder(h = 12, r = 4.05, $fn=100);

	translate([-1, 25, -1])
	cube([5.05, 6, 12]);

	translate([4.05, 25, -1])
	rotate( 172.1, [0, 0, 1])
	cube([6, 6, 12]);

	translate([4.1569, 16.6, -1])
	cylinder(h = 12, r = 1, $fn=100);

	translate([3.6569, 15.7339, -1])
	rotate( 60, [0, 0, 1])
	cube([2, 2, 12]);	
	
	translate([0, 25.8, 5])
	rotate( 90, [0, 1, 0])
	cylinder(h = 11, r = 1.65, $fn=100);
}

// Generar un hexágono circunscrito (Diametro,altura) 
module hexagono(d,h,c){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
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

		// Operaciones unicas para cada lado
		translate([-9, 25.8, 5])
		rotate( 90, [0, 1, 0])
		rotate( 90, [0, 0, 1])
		hexagono(5.9, 3);
		
		translate([7, 25.8, 5])
		rotate( 90, [0, 1, 0])
		cylinder(h = 3, r = 2.8, $fn=100);

	}	
}
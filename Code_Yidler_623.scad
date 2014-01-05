// Created from Code_Yidler_623.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

// Media Pieza
module mpieza(){
	translate([-11, -5, 0])
	cube([11, 5, 16]);

	translate([-11, -27, 0])
	cube([5, 27, 16]);

	translate([-6, -14, 0])
	cube([1, 9, 16]);	

	translate([-11, -27, 8])
	rotate( 90, [0, 1, 0])
	cylinder(h = 5, r = 8, $fn=100);
}

// Operaciones para media pieza
module moperaciones(){
	translate([-12, -27, 8])
	rotate( 90, [0, 1, 0])
	cylinder(h = 7, r = 1.65, $fn=100);
	
	translate([0, 1, 8])
	rotate( 90, [1, 0, 0])
	cylinder(h = 7, r = 3.2, $fn=100);

	translate([-6, -14, -1])
	rotate( 38, [0, 0, -1])
	cube([1, 2, 18]);
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
		translate([-11, -27, 8])
		rotate( 90, [0, 1, 0])
		hexagono(5.8, 4);
		
		translate([10, -27, 8])
		rotate( 90, [0, 1, 0])
		cylinder(h = 2, r = 2.9, $fn=100);
	}	
}

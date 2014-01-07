// Created from Code_Yidler_623.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.


// Media pieza
module mpieza(){
	// Bloque a lo largo del eje X
	translate([0, -5, 0])
	cube([11, 5, 16]);

	//	Bloque a lo largo del eje Y
	//	Bloque grande
		translate([6, -27, 0])
		cube([5, 27, 16]);
	//	Bloque pequeño
		translate([5, -14, 0])
		cube([1, 9, 16]);	
	//	Redondeo
		translate([6, -27, 8])
		rotate( 90, [0, 1, 0])
		cylinder(h = 5, r = 8, $fn=100);
}

// Operaciones para media pieza
module moperaciones(){
	// Taladro del soporte
	translate([0, 1, 8])
	rotate( 90, [1, 0, 0])
	cylinder(h = 7, r = 3.2, $fn=100);
	// Taladro para la polea
	translate([5, -27, 8])
	rotate( 90, [0, 1, 0])
	cylinder(h = 7, r = 1.65, $fn=100);
	// Chaflán interior
	translate([6, -14, -1])
	rotate( 232, [0, 0, -1])
	cube([2, 1, 18]);
}

// Generar un hexágono circunscrito (Diámetro,Altura) 
module hexagono(d,h){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
}

// Generamos la pieza y las operaciones
difference () {
	union() {
		// Pieza situada en {+X,-Y,+Z}
		mpieza();
		
		// Pieza simétrica situada en {-X,-Y,+Z}
		mirror([ 1, 0, 0 ])
		mpieza();
	}	
	union() {
		// Operaciones situadas en {+X,-Y,+Z}
		moperaciones();
		// Operaciones simétricas situadas en {-X,-Y,+Z}
		mirror([ 1, 0, 0 ])
		moperaciones();

		// Operaciones únicas para cada lado
		// Vaciado para la tuerca hexagonal 
		translate([-11, -27, 8])
		rotate( 90, [0, 1, 0])
		hexagono(5.8, 4);
		// Vaciado para la cabeza del tornillo
		translate([10, -27, 8])
		rotate( 90, [0, 1, 0])
		cylinder(h = 2, r = 2.9, $fn=100);
	}	
}

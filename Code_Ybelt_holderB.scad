// Created from Code_Ybelt_holderB.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

// Media Pieza
module mpieza(){
	cube([10.5, 5, 16]);

	translate([5, -9, 0])
	cube([5.5, 9, 16]);

	translate([5, -9, 0])
	cube([13.5, 7, 16]);

	translate([14.5, -1.5, 0])
	rotate( 225 ,[0, 0, 1])
	cube([1, 1, 16]);
}

// Operaciones para media pieza
module moperaciones(){

	translate([5, -7, -1])
	rotate( 225 ,[0, 0, 1])
	cube([3, 3, 18]);

	translate([18.5, -5, -1])
	rotate( 206.57 ,[0, 0, 1])
	cube([10, 4, 18]);

	translate([5, -7.5, 4])
	rotate( 45 ,[0, 0, 1])
	cube([10, 2, 8]);
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

		//Operaciones Unicas
		translate([0, -1, 8])
		rotate( -90, [1, 0, 0])
		cylinder(h = 7, r = 3.15, $fn=100);

		translate([0, -3.5, 8])
		rotate( 90, [1, 0, 0])
		rotate( 90, [0, 0, 1])
		hexagono(10, 11);
	}	
}

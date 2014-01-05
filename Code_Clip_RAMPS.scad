// Created from Code_Clip_RAMPS.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

// Media Pieza
module mpieza(){
	cube([27.5, 6, 15]);
	
	cube([4, 24.2, 15]);

	translate([23.5, 0, 0])
	cube([4, 34, 15]);

	translate([21.5, 30, 0])
	cube([6, 4, 15]);
}

// Operaciones para media pieza
module moperaciones(){

	translate([0, -1, -1])
	cube([17.5, 3, 17]);

	translate([24.15, 7, 7.5])
	rotate( 90, [1, 0, 0])
	union() {
		hexagono(5.7, 8);
		cylinder(h = 8, r = 1.7, $fn=100);
	}
   
	// Chaflanes del centro
	translate([3, 24.2, -1])
	rotate( -45 ,[0, 0, 1])
	cube([2, 1, 17]);

	translate([0, 23.2, 15])
	rotate( 90 ,[0, 1, 0])
	rotate( 45 ,[0, 0, 1])
	cube([2, 1, 4]);

	translate([0, 23.2, 0])
	rotate( 90 ,[0, 1, 0])
	rotate( 45 ,[0, 0, 1])
	cube([1, 2, 4]);

	// Chaflanes del extremo (duro)!!
	translate([21.5, 30, -1])
	rotate( 63.43 ,[0, 0, 1])
	cube([5, 2, 17]);

	translate([23.5, 30, 14])
	rotate( 90 ,[1, 0, 0])
	rotate( 45 ,[0, 0, 1])
	cube([2, 1, 24]);

	translate([24.5, 30, 0])
	rotate( 90 ,[1, 0, 0])
	rotate( 135 ,[0, 0, 1])
	cube([2, 1, 24]);
}

// Generar un hexágono circunscrito (Diametro,altura) 
module hexagono(d,h,c){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
}

// Creamos la pieza y las operaciones
module pieza(){
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
}

// Generamos una pieza
pieza();

// Generamos otra pieza desplazada y simétrica
translate([12, 43, 0])
mirror([ 0, 1, 0 ])
pieza();



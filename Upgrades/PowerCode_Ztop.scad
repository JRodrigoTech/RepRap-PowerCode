// Created from Code_Ztop.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jodrigo.net)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

dBar = 8.1 ;	// Diámetro de la varilla (8.1)

//Características del tornillo grande
dCab = 18 ;		// Diámetro de la cabeza (18)
hcub = 6.8 ;	// Anchura del cuadrado (6.8)

// Caracteristicas del tornillo M3
M3Drill = 3.4 ;		// Diámetro de la rosca (3.3)
M3Cap = 5.8 ;		// Diámetro de la cabeza (5.6)
M3Hex = 5.8 ;		// Altura entre caras planas de la tuerca (5.8)


// Bloque a trabajar
module bloque(){
	// Bloque tornillo en el eje y
	cube([12, 40, 24]);
	// Bloque varilla en plano xy
	translate([0, 21-2, 0])
	cube([45, 21, 9]);
	// Bloque a lo largo del eje x
	translate([0, 35, 0])
	cube([37, 5, 24]);
}

// Redondeo del bloque varilla en plano xy
module redondeoxy(){
	// Redondeo
	translate([15, 21-2, -1])
	cylinder(h = 16, r = 3, $fn=100);
	// Vaciado del sobrante
	translate([15, 20-2, -1])
	cube([31, 4, 16]);
}

// Alojamiento de la varilla
module tvar(){
	// Taladro
	translate([37, 29.5, -1])
	cylinder(h = 16, r = dBar/2, $fn=100);
	// Canal
	translate([36.5-16, 23.5+5, -1])
	cube([16, 2, 16]);
	// Canal
	translate([36.5-16, 23.5+5-8, -1])
	cube([2, 8, 16]);
	// Vaciado Top
	translate([12, 20, 6.5])
	cube([8.5, 15, 10]);
	// Chaflán pequeño
	translate([37-16.5, 41-6, 6.5])
	rotate( 90 ,[1, 0, 0])
	rotate( 51 ,[0, 0, 1])
	cube([5, 5, 6]);
}

// Alojamiento del tornillo
module ttor(){
	translate([9, 17, 15])
	union() {
		// Parte cuadrada
		cube([20, hcub, hcub], center = true);
		// Parte cilíndrica
		rotate( 90, [0, 1, 0])
		cylinder(h = 6, r = dCab/2, $fn=100);
	}
	// Vaciado superior
	translate([9, 13.6, 15])
	cube([4, 8, 10]);
}

// Operaciones a lo largo del eje y
module operacionesY(){

	translate([-1, -1, 5])
	cube([6, 32, 20]);

	translate([-1, 30, 9])
	cube([6, 11, 16]);

	translate([-1, 31, 5])
	rotate( 90 ,[0, 1, 0])
	rotate( 135 ,[0, 0, 1])
	cube([6, 6, 6]);

}

// Chaflanes del bloque tornillo
module chaftor(){
	// Chaflán verticall
	translate([7, 0, -1])
	rotate( -45 ,[0, 0, 1])
	cube([4, 7, 21]);
	// Chaflán superior
	translate([4, 0, 14])
	rotate( 90 ,[0, 1, 0])
	rotate( 135 ,[0, 0, 1])
	cube([15, 8, 9]);
}

//Chaflanes a lo largo del eje X
module chaflanX(){
	// Chaflán grande
	translate([0, 40, 9])
	rotate( 90 ,[0, 1, 0])
	rotate( 135 ,[0, 0, 1])
	cube([12, 22, 46]);
	// Chaflán pequeño
	translate([37, 41, 9])
	rotate( 90 ,[1, 0, 0])
	rotate( 45 ,[0, 0, 1])
	cube([15, 22, 7]);
}

//Chaflanes del bloque varilla en plano xy
module chafvar(){
	// Chaflán grande
	translate([45, 35, -1])
	rotate( 45 ,[0, 0, 1])
	cube([6, 8, 16]);
	// Chaflán pequeño
	translate([42-2, 24-2, -1])
	rotate( -45 ,[0, 0, 1])
	cube([8, 12, 16]);
}

// Generar un hexágono circunscrito (Diámetro,Altura) 
module hexagono(d,h){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
}

module prisionero(){
	// Taladro
	translate([28,41,9/2])
	rotate( 90, [1, 0, 0])
	cylinder(h = 20, r = M3Drill/2, $fn=100);
	// Taladro
	translate([28,41,9/2])
	rotate( 90, [1, 0, 0])
	cylinder(h = 4, r = M3Cap/2, $fn=100);
	// Alojamiento de la tuerca
	translate([28, 20+2.5, 9/2])
	rotate( 90, [1, 0, 0])
	hexagono(M3Hex, 4);
}

// Unión de todos los bloques y operaciones
module pieza(){
	difference () {
		// Bloque a trabajar
		bloque();

		// Unión de operaciones
		union() {
			// Alojamiento de la varilla
			tvar();
			// Alojamiento del tornillo prisionero
			prisionero();
			// Alojamiento para el tornillo
			ttor();
			// Redondeo del bloque varilla en plano xy
			redondeoxy();
			// Operaciones a lo largo del eje y
			operacionesY();
			// Chaflanes
			chaftor();
			chaflanX();
			chafvar();

		} //union end	
	} // difference end
} // module pieza end

/**************************/
//  Generamos las piezas   /
/**************************/

// Pieza normal
translate([0, 8, 0])
pieza();

// Pieza simetrica
translate([0, -8, 0])
mirror([ 0, 1, 0 ]) 
pieza();

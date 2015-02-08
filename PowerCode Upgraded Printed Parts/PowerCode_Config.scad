// Global configuration file of PowerCode
// By J.Rodigo (www.jrodrigo.net)
// Licence Creative commons atribution & share alike.
// Author: Mecano ( https://github.com/Mecan0/Code )

//*************************************************//
//       Parámetros de configuración global        //
//*************************************************//

// Resolución de las superficies curvas
$fn = 100 ;		

// Cojinetes Lineales
dCoLi = 15 ;	// Diámetro LM8UU(15) IGUS(16)

// Varillas lisas
dVaLi = 8.15 ; // Diámetro




//*************************************************//
//              Módulos de uso global              //
//*************************************************//

// Generar un hexágono circunscrito (Diámetro,altura) 
module hexagono(d,h){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
}

// Generar un cuadrado/chaflán a 45º (Arista,Altura,Giro{0 = 45º, 1 = 135º, ...}) 
module chamfer(a,h,g){ 
	rotate( g*90 + 45 , [0, 0, 1])
	cube([a, a, h]);
}
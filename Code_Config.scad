// Global configuration file of PowerCode
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.
// Author: Mecano ( https://github.com/Mecan0/Code )

//************************************//
// Parametros de configuración global //
//************************************//



//************************************//
//        Modulos de uso global       //
//************************************//

// Generar un hexágono circunscrito (Diametro,altura) 
module hexagono(d,h){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
}

// Generar un cuadrado/chaflán a 45º (Aresta,Altura,Giro{0 = 45º, 1 = 135º, ...}) 
module chamfer(a,h,g){ 
	rotate( g*90 + 45 , [0, 0, 1])
	cube([a, a, h]);
}
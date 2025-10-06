class Cosa {
	var property peso = 0
	var property nivelPeligrosidad = 0
	var property bultos = 1 
}

object bumblebee {
	const property peso = 800
	var modoTransformacion = "auto"
	const property bultos = 2 
	

	//Estrategia funciona pero con malas practicas. Manejo con strings esta bien? 
	method nivelPeligrosidad() {
		if (modoTransformacion == "auto") {
			return 15
		} else {
			if (modoTransformacion == "robot") {
				return 30
			} else {
				return null
			}
		}
	}
	
	method transformar() {
		if (modoTransformacion == "auto") {
			modoTransformacion = "robot"
		} else {
			modoTransformacion = "auto"
		}
	}
	
	method modoTransformacion() = modoTransformacion

	method efectoDeAccidente(){
		self.transformar()
	}
}

object paqueteLadrillos {
	var property cantidadLadrillos = 1
	
	method peso() = cantidadLadrillos * 2
	
	method nivelPeligrosidad() = 2

	method bultos(){
		if(cantidadLadrillos<=100){
			return 1
		} else if (cantidadLadrillos>=101 and cantidadLadrillos<=300){
			return 2
		} else {
			return 3
		}
	}

	method efectoDeAccidente(){
		if (cantidadLadrillos>=12){
			cantidadLadrillos-=12
		}else{
			cantidadLadrillos=0
		}
	}
}

object bateriaAntiaerea {
	var property estaConMisiles = false
	
	method peso() {
		if (estaConMisiles) {
			return 300
		} else {
			return 200
		}
	}
	
	method nivelPeligrosidad() {
		if (estaConMisiles) {
			return 100
		} else {
			return 0
		}
	}
	
	method recargarMisiles() {
		estaConMisiles = true
	}

	method bultos(){
		if (estaConMisiles){
			return 2
		}else{
			return 1
		}
	}

	method efectoDeAccidente(){
		estaConMisiles = false
	}
}

// const knightRider = new Cosa(peso = 500, nivelPeligrosidad = 10)
object knightRider{
	var property peso = 500
	var property nivelPeligrosidad = 10
	var property bultos = 1 

	method efectoDeAccidente(){}
}

object arenaAGranel{
	var property peso = 0
	var property nivelPeligrosidad = 1
	var property bultos = 1

	method efectoDeAccidente(){
		peso+=20
	}
}

// const residuosRadioactivos = new Cosa(nivelPeligrosidad = 200)
object residuosRadioactivos{
	var property peso = 0
	var property nivelPeligrosidad = 200
	var property bultos = 1 

	method efectoDeAccidente(){
		peso+=15
	}
}

const misiles = new Cosa(bultos = 0)

//MAS COSAS
object contenedorPortuario {
	const property cosas = #{}
	
	method peso() = 100 + self.pesoContenido()
	
	method pesoContenido() = self.cosas().sum({ cosa => cosa.peso() })
	
	method nivelDePeligrosidad() {
		if (self.cosas().isEmpty()) {
			return 0
		} else {
			return self.cosas().max(
				{ elemento => elemento.nivelPeligrosidad() }
			).nivelPeligrosidad()
		}
	}

	method bultos(){
		if(not cosas.isEmpty()){
			return 1+self.cosas().sum{cosa => cosa.bultos()}
		}else{
			return 1
		}
	}

	method efectoDeAccidente(){
		self.cosas().forEach{cosa => cosa.efectoDeAccidente()}
	}
}

object embalajeDeSeguridad {
	var property cosaEnvuelta = null
	const property bultos= 2
	
	method peso() = cosaEnvuelta.peso()
	
	method nivelDePeligrosidad() = cosaEnvuelta.nivelPeligrosidad()/2

	method embalarCosa(cosa){
		cosaEnvuelta=cosa
	}

	method efectoDeAccidente(){}
}
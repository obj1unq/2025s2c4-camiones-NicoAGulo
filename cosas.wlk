class Cosa {
	var property peso = 0
	var property nivelPeligrosidad = 0
}

object bumblebee {
	const property peso = 800
	var modoTransformacion = "auto"

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

	method modoTransformacion(){return modoTransformacion}
}

object paqueteLadrillos{
	var property cantidadLadrillos=1

	method peso(){return cantidadLadrillos*2}

	method nivelPeligrosidad()=2
}

object bateriaAntiaerea{
	var property estaConMisiles = false

	method peso(){
		if (estaConMisiles){
			return 300
		}else{
			return 200
		}
	}

	method nivelPeligrosidad(){
		if (estaConMisiles){
			return 100
		}else{
			return 0
		}
	}

	method recargarMisiles(){
		estaConMisiles=true
	}
}

const knightRider = new Cosa(peso = 500, nivelPeligrosidad = 10)

const arenaAGranel = new Cosa(nivelPeligrosidad = 1)

const residuosRadioactivos = new Cosa(nivelPeligrosidad=200)

const misiles = new Cosa ()

//MAS COSAS

object contenedorPortuario{
	const property cosas = #{}

	method peso() = 100 + self.pesoContenido()

	method pesoContenido(){
		return self.cosas().sum({ cosa => cosa.peso() })
	}

	method nivelDePeligrosidad(){
		if (self.cosas().isEmpty()){
			return 0
		}else{
			return self.cosas().max({elemento => elemento.nivelPeligrosidad()}).nivelPeligrosidad()
		}
	}
}

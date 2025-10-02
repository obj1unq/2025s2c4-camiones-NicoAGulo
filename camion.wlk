import cosas.*

object camion {
	const property cosas = #{}
	const pesoDeTara=1000
	
	method cargar(unaCosa) {
		if (not cosas.contains(unaCosa)) {
			cosas.add(unaCosa)
		} else {
			// self.error(("Ya existe en el equipaje"))
			throw new Exception(message = "No se puede cargar algo que ya esta cargado")
		}
	}
	
	method descargar(unaCosa) {
		if (cosas.contains(unaCosa)) cosas.remove(unaCosa)
		else self.error("No se puede descargar algo que no existe en el camion")
	}

	method esPesoPar(){
		return self.cosas().all {n => (n.peso()%2 ==0)}
	}

	method tienePesoDeterminado(kg){
		return self.cosas().any{cosa => cosa.peso() == kg}
	}

	method pesoTotal(){
		return pesoDeTara + self.cosas().sum{cosa => cosa.peso()}
	}

	method esExcesoDePeso(){
		return self.pesoTotal()>2500
	}

}
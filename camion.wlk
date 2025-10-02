import cosas.*

object camion {
	const property cosas = #{}
	
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
}
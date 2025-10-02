import cosas.*

object camion {
	const property cosas = #{}
	const pesoDeTara = 1000
	
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
	
	method esPesoPar() = self.cosas().all({ n => (n.peso() % 2) == 0 })
	
	method tieneCargaConPesoDeterminado(kg) = self.cosas().any(
		{ cosa => cosa.peso() == kg }
	)
	
	method pesoTotal() = pesoDeTara + self.cosas().sum({ cosa => cosa.peso() })
	
	method esExcesoDePeso() = self.pesoTotal() > 2500
	
	method cargaConNivelDePeligrosidadDeterminado(lvl) = self.cosas().find(
		{ cosa => cosa.nivelPeligrosidad() == lvl }
	)
	
	method cargasConNivelDePeligrosidadMayorA(lvl) = self.cosas().filter(
		{ cosa => cosa.nivelPeligrosidad() > lvl }
	)
	
	method cargasMasPeligrosasQue(
		cosaPeligrosa
	) = self.cargasConNivelDePeligrosidadMayorA(cosaPeligrosa.nivelPeligrosidad())
}
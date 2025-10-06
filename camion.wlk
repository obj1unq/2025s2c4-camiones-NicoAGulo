object camion {
	var property cosas = #{}
	const pesoDeTara = 1000
	
	method cargar(unaCosa) {
		if (not cosas.contains(unaCosa)) {
			cosas.add(unaCosa)
		} else {
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
	
	method puedeCircularEnRuta(maxNivelPeligrosidad){ 
		return
		(not self.esExcesoDePeso()) 
		and 
		self.cargasConNivelDePeligrosidadMayorA(maxNivelPeligrosidad).isEmpty()
	}
	
	method cargaEntreMinimoYMaximoDelPeso(min, max) = self.cosas().any(
		{ elementoCargado =>
			(elementoCargado.peso() > min) and (elementoCargado.peso() < max) }
	)
	
	method cargaMasPesada() {
		if (not self.cosas().isEmpty()){
			return self.cosas().max{cosa => cosa.peso()}
		}else{
			throw new Exception(message="No hay carga por lo tanto no existe ninguna carga pesada")
		}
	}

	method pesoDeCadaCarga(){
		if (not self.cosas().isEmpty()){
			return self.cosas().map{cosa => cosa.peso()}
		}else{
			throw new Exception(message="No hay carga por lo tanto no existe ninguna carga pesada")
		}
	}

	method totalBultos(){
		return cosas.sum{cosa => cosa.bultos()}
	}

	method sufrirAccidente(){
		self.cosas().forEach{cosa => cosa.efectoDeAccidente()}
	}

	method descargarTodoEn(almacen){
		self.cosas().forEach{cosa => almacen.almacenar(cosa)}
		cosas = #{}
	}

	method puedeTransportarPor(trayecto){
		return trayecto.requerimientos(self)
	}

	method transportar(destino, camino){
		if (self.puedeTransportarPor(camino)){
			self.descargarTodoEn(destino)
		}
		else{
			throw new Exception(message = "Uno de los requerimientos para transportar por el camino deseado  no se cumplio")
		}
	}
}
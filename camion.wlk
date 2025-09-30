import cosas.*

object camion {
	const property cosas = #{}
	
	method cargar2(unaCosa) {
		if (not cosas.contains(unaCosa)) cosas.add(unaCosa)
		else self.error(("Ya existe " + unaCosa) + " en el equipaje")
	}
	
	method cargar(unaCosa) {
		try {
			if (not cosas.contains(unaCosa)) {
				cosas.add(unaCosa)
			} else {
				self.error(("Ya existe " + unaCosa) + " en el equipaje")
			}
		}catch error{
			return 1
		}
	}
	
	method descargar(unaCosa) {
		if (cosas.contains(unaCosa)) cosas.remove(unaCosa)
		else self.error(("No existe " + unaCosa) + " en el equipaje")
	}
}
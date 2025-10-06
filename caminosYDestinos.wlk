object ruta9{
    const nivelDePeligrosidad= 20
    method requerimientos(vehiculo){
        return vehiculo.puedeCircularEnRuta(nivelDePeligrosidad)
    }
}

object caminosVecinales {
    var property pesoMaximoPermitido=10000

    method requerimientos(vehiculo){
        return(vehiculo.pesoTotal()<pesoMaximoPermitido)
    }
}

object almacenDeCosas{
    var property cosas = #{}

    method almacenar(algo){
        self.cosas().add(algo)
    }
}
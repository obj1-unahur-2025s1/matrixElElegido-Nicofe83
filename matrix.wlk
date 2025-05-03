import wollok.vm.*
object neo{
    var energia = 100

    method esElElegido() = true

    method saltar()
    {energia = energia / 2
    }

    method vitalidad() = energia * 0.1

}

object morfeo{
    var vitalidad = 8

    var estaDescansado = true

    method esElElegido() = false

    method saltar() {
        vitalidad = (vitalidad - 1).max(0)
        estaDescansado = !estaDescansado
        }
    
    method vitalidad() = vitalidad
}

object trinity{

    method esElElegido() = false

    method saltar() {}
    
    method vitalidad() = 0
}

object nave{
    const pasajeros = #{neo, morfeo, trinity}

    method cuantosPasajerosHay() = pasajeros.size()

    method pasajeroConMayorVitalidad() = pasajeros.max({p => p.vitalidad()}) 

    method pasajeroConMenorVitalidad() = pasajeros.min({p => p.vitalidad()}) 

    method estaEquilibrada() {
        self.pasajeroConMayorVitalidad().vitalidad() < 
        self.pasajeroConMenorVitalidad().vitalidad() *2
    }

    method estaElElegido() = pasajeros.any({p=> p.esElElegido()})

    method chocar() {
        pasajeros.forEach({p=> p.saltar()})
        pasajeros.clear()
    }

    method acelerar(){
        pasajeros.filter({p=> not p.esElElegido()}).forEach({p=>p.saltar()})
        pasajeros.remove(neo)
    }
}
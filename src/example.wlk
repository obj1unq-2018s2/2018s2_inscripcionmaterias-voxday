class Materia {
	var creditosQueOtorga 
	var h
	
	method creditos(num){
		creditosQueOtorga = num
	}
	
	method creditosQueOtorga(){
		return creditosQueOtorga
	}
	
	method prerequisito(alumno){
		return "ninguno"
	}
}

class MateriaConCorrelativas inherits Materia {
	var correlativas = #{}
	
	override method prerequisito(alumno){
		return correlativas.all {materia => alumno.aprobo(materia)}
	} 

}

class MateriaConCreditos inherits Materia {
	var creditosNecesarios 
	
	method creditosNecesarios(num){
		creditosNecesarios = num
	}
	
	method creditosNecesarios(){
		return creditosNecesarios
	}
	
	override method prerequisito(alumno){
		return creditosNecesarios == alumno.creditosAcumulados()
	}
}


class MateriaConAnio inherits Materia {
	
}


class Estudiante {
	var creditosAcumulados = 0
	var materiasAprobadas = []
	var carrerasEnCurso = []
	var materiasEnCurso = []
	
	method aprobo(materia){
		return materiasAprobadas.contains(materia)
	}
	
	method estaCursando(materia){
		return materiasEnCurso.contains(materia)
	}
	method puedeAnotarse(materia){
		return not self.aprobo(materia) and not self.estaCursando(materia)
	}
	
	method creditosAcumulados(){
		return creditosAcumulados
	}
	

}

class Nota {
	
}

class Carrera {
	var materias = #{}
}

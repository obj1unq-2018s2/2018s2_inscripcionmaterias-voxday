class Materia {
	var creditosQueOtorga 
	// var nombreMateria
	var anio
	var carrera
	const curso = #{}
	var cupo = 0
	var listaDeEspera = []
	
	method cupo(num){
		cupo = num
	}
	
	method cupo(){
		return cupo
	}
	method creditos(num){
		creditosQueOtorga = num
	}
	
	method creditosQueOtorga(){
		return creditosQueOtorga
	}
	
	method carrera(string){
		carrera = string
	}
	
	method carrera (){
		return carrera
	}
	
	method cumplePrerequisito(alumno){
		return "ninguno"
	}
	
	method anio(num){
		anio = num
	}
	method anio(){
		return anio
	}
	
	method inscribir(estudiante){
		if(estudiante.puedeCursar(self) and curso.sum() < self.cupo()){
			curso.add(estudiante)
		}
		
	}
	
	method darDeBaja(estudiante){
		curso.remove(estudiante)
		if(not listaDeEspera.isEmpty()){
			curso.add(listaDeEspera.first())
		}
	}
}

class MateriaConCorrelativas inherits Materia {
	var correlativas = #{}
	
	override method cumplePrerequisito(alumno){
		return correlativas.all {materia => alumno.aprobo(materia)}
	} 

}

class MateriaConCreditos inherits Materia {
	var property creditosNecesarios 
	
	override method cumplePrerequisito(alumno){
		return   alumno.creditosAcumulados() >= creditosNecesarios
	}
}


class MateriaConAnio inherits Materia {
	
	
	method materiasDelAnioanterior(carrera){
		return carrera.materiasDelAnio(anio -1)
	}
	
	override method cumplePrerequisito(estudiante){
		return estudiante.aproboMaterias(self.materiasDelAnioAnterior(carrera))
	}
	
	
}


class Estudiante {
	var creditosAcumulados = 0
	var materiasAprobadas = []
	var carrerasEnCurso = []
	var materiasEnCurso = []
	
	method aprobo(materia){
		return materiasAprobadas.contains(materia)
	}
	
	method aproboMaterias(materias) {
		
	 materias.all { materia => self.aprobo(materia) }
	}
	method estaCursando(materia){
		return materiasEnCurso.contains(materia)
	}
	method puedeCursar(materia){
		return not self.aprobo(materia) and not self.estaCursando(materia)
		 and materia.cumplePrerequisito(self) and self.perteneceACarrera(materia)
	}
	
	method creditosAcumulados(){
		return creditosAcumulados
	}
	
	method perteneceACarrera(materia){
		return carrerasEnCurso.contains(materia.carrera())
	}

}

class Nota {
	var property nombreyApellido
	var property calificacion
	var property materia
	
	}
	

class Carrera {
	var materias = #{}
	
	
	method materiasPorAnio(num){
		materias.filter {materia => materia.anio() == num}
	}
	
}

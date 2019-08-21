def read_alum(file_name)
 file = File.open(file_name, 'r')
 alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
 file.close
 alum
end

def end_line
  puts "---------------------------------------------------------------------"
end

def students_average
  students = read_alum('alumnos.csv')
  students.each do |student_average|
    sum = 0
    student_average.each_with_index do |student, index|
      sum += student.to_f unless index == 0
    end
    puts "Estudiante: #{student_average[0]} tiene un promedio de #{sum/(student_average.length-1)}"
  end
  end_line
end

def absents_student
  students = read_alum('alumnos.csv')
  students.each do |student_info|
    sum = 0
    student_info.each_with_index do |student, index|
      sum += 1 if student == "A"
    end
  puts "Estudiante: #{student_info[0]} tiene #{sum} inasistencia(s)"
  end
end_line
end


option = 0
while option != 4
  puts 'Ingresa una de las siguientes opciones: '
  puts 'Opción 1: Imprimir en pantalla el nombre de cada alumno y el promedio de sus notas.'
  puts 'Opción 2: Imprimir en pantalla el nombre de cada alumno y la cantidad de inasistencias'
  puts 'Opción 3: Imprimir en pantalla los nombres de los alumnos aprobados'
  puts 'Opción 4: Salir del menú.'
    option = gets.chomp.to_i

  case option
  when 1
    students_average
  when 2
    puts absents_student
  when 3
    puts students_passed(5.0)
  when 4
    puts "¡Hasta pronto!"
  else
    puts "Opción inválida: debes elegir entre 1 y 4."
  end
end

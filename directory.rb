# Don't need this old array any more
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

def input_students
  puts "Please enter the name of a student!"
  puts "To finish, just hit return twice."
  #creates an empty array
  students = []
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
# return the array of students, otherwise the array remains a local variable
  students
end

def input_students_name_cohort_hobby
  students = []
  while true do
    newstudent = {
      cohort: :Smarch,
      hobby: :Bogeling
    }
    puts "Please input the name of a student! Or to finish, just hit return."
    newname = gets.chomp
    if newname.empty? then return students else newstudent[:name] = newname end
    puts "Cohort? If you just press enter I'll assume it's Smarch."
    cohort = gets.chomp.capitalize
    if cohort != "" then newstudent[:cohort] = cohort.to_sym end
    puts "Hobby? The default is bogeling because everyone likes bogeling."
    hobby = gets.chomp.capitalize
    if hobby != "" then newstudent[:hobby] = hobby.to_sym end
    # students << {name: name, cohort: cohort, hobby: hobby}
    students << newstudent
    puts students.length == 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, num|
    puts "#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort; Their favourite hobby is #{student[:hobby]})"
  end
end

def print_footer(names)
  puts names.length == 1 ? "Overall, we have #{names.length} great student!" : "Overall, we have #{names.length} great students!"
end

def print_students_starting_with_letter(students)
  puts "Alright then, give us a letter:"
  letter = gets.chomp.downcase
  puts "Okay, here are all the names beginning with #{letter}"
  students.each_with_index do |student, num|
    if student[:name][0].downcase == letter
    puts "#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
end

def print_students_under_n_letters(students)
  puts "Alright then, give us a number:"
  number = gets.chomp.to_i
  puts "Okay, here are all the names shorter than #{number} letters:"
  students.each_with_index do |student, num|
    if student[:name].length <= number
    puts "#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
end

students = input_students_name_cohort_hobby
print_header
#print(students)
print(students)
print_footer(students)
